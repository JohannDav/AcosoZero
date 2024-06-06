package paquete;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paquete.Reporte;

@WebServlet(name = "ReporteServlet", urlPatterns = {"/ReporteServlet"})
public class Reporteservlet extends HttpServlet {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/bdsfrentas";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "n0m3l0";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "list":
                    listarReportes(request, response);
                    break;
                case "insert":
                    insertarReporte(request, response);
                    break;
                case "update":
                    actualizarReporte(request, response);
                    break;
                case "delete":
                    eliminarReporte(request, response);
                    break;
            }
        }
    }

    private void listarReportes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Reporte> reportes = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "SELECT * FROM reporte";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int idReporte = resultSet.getInt("idReporte");
                String nombres = resultSet.getString("Nombres");
                String descripcion = resultSet.getString("Descripcion");
                double precio = resultSet.getDouble("Precio");
                int cantreporte = resultSet.getInt("Cantreporte");
                String imagen = resultSet.getString("Imagen");
                String fechasuceso = resultSet.getString("Fechasuceso");
                String turno = resultSet.getString("Turno");
                String lugar = resultSet.getString("Lugar");
                String correou = resultSet.getString("Correou");
                
                Reporte reporte = new Reporte(idReporte, nombres, descripcion, precio, cantreporte, imagen, fechasuceso, turno, lugar, correou);
                reportes.add(reporte);
            }

            request.setAttribute("reportes", reportes);
            request.getRequestDispatcher("lista_reporte.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void insertarReporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombres = request.getParameter("nombres");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantreporte = Integer.parseInt(request.getParameter("cantreporte"));
        String imagen = request.getParameter("imagen");
        String fechasuceso = request.getParameter("fechasuceso");
        String turno = request.getParameter("turno");
        String lugar = request.getParameter("lugar");
        String correou = request.getParameter("correou");

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "INSERT INTO reporte (Nombres, Descripcion, Precio, Cantreporte, Imagen, Fechasuceso, Turno, Lugar, Correou) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombres);
            statement.setString(2, descripcion);
            statement.setDouble(3, precio);
            statement.setInt(4, cantreporte);
            statement.setString(5, imagen);
            statement.setString(6, fechasuceso);
            statement.setString(7, turno);
            statement.setString(8, lugar);
            statement.setString(9, correou);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("ReporteServlet?action=list");
    }

    private void actualizarReporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idReporte = Integer.parseInt(request.getParameter("idReporte"));
        String nombres = request.getParameter("nombres");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantreporte = Integer.parseInt(request.getParameter("cantreporte"));
        String imagen = request.getParameter("imagen");
        String fechasuceso = request.getParameter("fechasuceso");
        String turno = request.getParameter("turno");
        String lugar = request.getParameter("lugar");
        String correou = request.getParameter("correou");

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "UPDATE reporte SET Nombres = ?, Descripcion = ?, Precio = ?, Cantreporte = ?, Imagen = ?, Fechasuceso = ?, Turno = ?, Lugar = ?, Correou = ? WHERE idReporte = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombres);
            statement.setString(2, descripcion);
            statement.setDouble(3, precio);
            statement.setInt(4, cantreporte);
            statement.setString(5, imagen);
            statement.setString(6, fechasuceso);
            statement.setString(7, turno);
            statement.setString(8, lugar);
            statement.setString(9, correou);
            statement.setInt(7, idReporte);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("ReporteServlet?action=list");
    }

    private void eliminarReporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idReporte = Integer.parseInt(request.getParameter("idReporte"));

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "DELETE FROM reporte WHERE idReporte = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, idReporte);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("ReporteServlet?action=list");
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
    }
}