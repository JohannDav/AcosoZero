package com.rs.controlador;

import com.rs.config.Fecha;
import com.rs.modelo.Carrito;
import com.rs.modelo.Usuario;
import com.rs.modelo.UsuarioDAO;
import com.rs.modelo.Compra;
import com.rs.modelo.ComprasDAO;
import com.rs.modelo.DetalleCompra;
import com.rs.modelo.Pago;
import com.rs.modelo.Reporte;
import com.rs.modelo.ReporteDAO;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Controlador extends HttpServlet {

    Pago pago = new Pago();
    Usuario cl = new Usuario();
    UsuarioDAO cldao = new UsuarioDAO();
    ComprasDAO cdao = new ComprasDAO();
    ReporteDAO pdao = new ReporteDAO();
    Reporte p = new Reporte();
    int item = 0;
    int cantidad = 1;
    double subtotal = 0.0;
    double totalPagar = 0.0;

    List<Carrito> listaReportes = new ArrayList<>();
    List reportes = new ArrayList();

    String logueo = "Iniciar Sesion";
    String correo = "Iniciar Sesion";

    int idcompra;
    int idpago;
    double montopagar;
    int idReporte = 0;

    Carrito car = new Carrito();

    Fecha fechaSistem = new Fecha();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("logueo", logueo);
        session.setAttribute("correo", correo);
        reportes = pdao.listar();
        String accion = request.getParameter("accion");

        switch (accion) {
            case "carrito":
                totalPagar = 0.0;
                item = 0;
                request.setAttribute("Carrito", listaReportes);
                for (int i = 0; i < listaReportes.size(); i++) {
                    totalPagar = totalPagar + listaReportes.get(i).getSubTotal();
                    listaReportes.get(i).setItem(item + i + 1);
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("vistas/carrito.jsp").forward(request, response);
                break;
            case "Comprar":
                agregarCarrito(request);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                break;
            case "AgregarCarrito":
                agregarCarrito(request);
                request.setAttribute("cont", listaReportes.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "deleteReporte":
                idReporte = Integer.parseInt(request.getParameter("id"));
                if (listaReportes != null) {
                    for (int j = 0; j < listaReportes.size(); j++) {
                        if (listaReportes.get(j).getIdReporte() == idReporte) {
                            listaReportes.remove(j);
                        }
                    }
                }
                break;
            case "updateCantidad":
                idReporte = Integer.parseInt(request.getParameter("id"));
                int cant = Integer.parseInt(request.getParameter("cantidad"));
                for (int j = 0; j < listaReportes.size(); j++) {
                    if (listaReportes.get(j).getIdReporte() == idReporte) {
                        listaReportes.get(j).setCantidad(cant);
                        listaReportes.get(j).setSubTotal(listaReportes.get(j).getPrecioCompra() * cant);
                    }
                }
                break;

            case "Validar":
                String email = request.getParameter("txtemail");
                String pass = request.getParameter("txtpass");
                cl = cldao.Validar(email, pass);
                if (cl.getId() != 0) {
                    logueo = cl.getNombres();
                    correo = cl.getEmail();
                }
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "Registrar":
                String nom = request.getParameter("txtnom");
                String boleta = request.getParameter("txtboleta");
                String em = request.getParameter("txtemail");
                String pas = request.getParameter("txtpass");
                String dir = request.getParameter("txtdire");
                cl.setNombres(nom);
                cl.setBoleta(boleta);
                cl.setEmail(em);
                cl.setPass(pas);
                cl.setDireccion(dir);
                cldao.AgregarUsuario(cl);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                break;
            case "Nuevo":
                listaReportes = new ArrayList();
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "Buscar":
                String nombre = request.getParameter("txtbuscar");
                reportes = pdao.buscar(nombre);
                request.setAttribute("cont", listaReportes.size());
                request.setAttribute("reportes", reportes);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "RealizarPago":
                montopagar = totalPagar;
                if (cl.getId() != 0 && montopagar > 0) {
                    cdao.Pagar(montopagar);
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    montopagar = 0;
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;
            case "GenerarCompra":
                idpago = cdao.IdPago();
                if (cl.getId() != 0 && listaReportes.size() != 0 && montopagar > 0) {
                    if (totalPagar > 0.0) {
                        Compra co = new Compra();
                        co.setIdUsuario(cl.getId());
                        co.setFecha(fechaSistem.FechaBD());
                        co.setMonto(totalPagar);
                        co.setIdPago(idpago);
                        co.setEstado(" En Proceso de Envio");
                        cdao.guardarCompra(co);
                        montopagar = 0;

                        idcompra = cdao.IdCompra();
                        for (int i = 0; i < listaReportes.size(); i++) {
                            DetalleCompra dc = new DetalleCompra();
                            dc.setIdcompra(idcompra);
                            dc.setIdreporte(listaReportes.get(i).getIdReporte());
                            dc.setCantidad(listaReportes.get(i).getCantidad());
                            dc.setPrecioCompra(listaReportes.get(i).getPrecioCompra());
                            cdao.guardarDetalleCompra(dc);
                        }
                        listaReportes = new ArrayList<>();
                        List compra = cdao.misCompras(cl.getId());
                        request.setAttribute("myCompras", compra);
                        request.getRequestDispatcher("vistas/compras.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;
            case "MisCompras":
                if (cl.getId() != 0) {
                    List compra = cdao.misCompras(cl.getId());
                    request.setAttribute("myCompras", compra);
                    request.getRequestDispatcher("vistas/compras.jsp").forward(request, response);
                } else if (listaReportes.size() > 0) {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                }
                break;
            case "verDetalle":
                totalPagar = 0.0;
                int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                List<DetalleCompra> detalle = cdao.Detalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPagar = totalPagar + (detalle.get(i).getPrecioCompra() * detalle.get(i).getCantidad());
                }
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("vistas/DetalleCompra.jsp").forward(request, response);
                break;
            case "NuevoReporte":
                request.setAttribute("reportes", reportes);
                request.getRequestDispatcher("vistas/addReporte.jsp").forward(request, response);
                break;
            case "GuardarReporte":
                ArrayList<String> pro=new ArrayList<>();
                try {
                    p.setId(Integer.parseInt(pro.get(1)));
                    p.setNombres(pro.get(2));
                    p.setDescripcion(pro.get(3));
                    p.setPrecio(Double.parseDouble(pro.get(4)));
                    p.setCantreporte(Integer.parseInt(pro.get(5)));
                    p.setImagen(pro.get(6));
                    p.setFechasuceso(pro.get(7));
                    pdao.AgregarNuevoReporte(p);

                } catch (Exception e) {
                    System.err.println(""+e);
                }
                request.getRequestDispatcher("Controlador?accion=NuevoReporte").forward(request, response);
                break;

            case "Salir":
                listaReportes = new ArrayList();
                cl = new Usuario();
                session.invalidate();
                logueo = "Iniciar Sesion";
                correo = "Iniciar Sesion";
                request.getRequestDispatcher("Controlador?accion=Salirr").forward(request, response);
                break;
            default:
                request.setAttribute("cont", listaReportes.size());
                request.setAttribute("reportes", reportes);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void agregarCarrito(HttpServletRequest request) {
        cantidad = 1;
        int pos = 0;
        int idpp = Integer.parseInt(request.getParameter("id"));
        if (listaReportes.size() > 0) {
            for (int i = 0; i < listaReportes.size(); i++) {
                if (listaReportes.get(i).getIdReporte() == idpp) {
                    pos = i;
                }
            }
            if (idpp == listaReportes.get(pos).getIdReporte()) {
                cantidad = listaReportes.get(pos).getCantidad() + cantidad;
                subtotal = listaReportes.get(pos).getPrecioCompra() * cantidad;
                listaReportes.get(pos).setCantidad(cantidad);
                listaReportes.get(pos).setSubTotal(subtotal);
            } else {
                car = new Carrito();
                p = pdao.listarId(idpp);
                car.setIdReporte(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setFechasuceso(p.getFechasuceso());
                subtotal = cantidad * p.getPrecio();
                car.setSubTotal(subtotal);
                listaReportes.add(car);
            }
        } else {
            car = new Carrito();
            p = pdao.listarId(idpp);
            car.setIdReporte(p.getId());
            car.setNombres(p.getNombres());
            car.setDescripcion(p.getDescripcion());
            car.setPrecioCompra(p.getPrecio());
            car.setCantidad(cantidad);
            car.setFechasuceso(p.getFechasuceso());
            subtotal = cantidad * p.getPrecio();
            car.setSubTotal(subtotal);
            listaReportes.add(car);
        }
    }
    
}
