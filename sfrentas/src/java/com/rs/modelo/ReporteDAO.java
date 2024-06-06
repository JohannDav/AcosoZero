package com.rs.modelo;

import com.rs.config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ReporteDAO extends Conexion{

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    public List buscar(String nombre) {
        List list=new ArrayList();
        String sql = "select * from reporte where Nombres like '%"+nombre+"%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Reporte p=new Reporte();
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setCantreporte(rs.getInt(5));    
                p.setImagen(rs.getString(6));
                p.setFechasuceso(rs.getString(7));
                p.setTurno(rs.getString(8));
                p.setLugar(rs.getString(9));
                p.setCorreou(rs.getString(10));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Reporte listarId(int id) {
        Reporte p = new Reporte();
        String sql = "select * from reporte where IdReporte=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setCantreporte(rs.getInt(5));   
                p.setImagen(rs.getString(6));
                p.setFechasuceso(rs.getString(7));
                p.setTurno(rs.getString(8));
                p.setLugar(rs.getString(9));
                p.setCorreou(rs.getString(10));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public List listar() {
        List lista = new ArrayList();
        String sql = "select * from reporte";
        try {            
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Reporte p = new Reporte();
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setCantreporte(rs.getInt(5));   
                p.setImagen(rs.getString(6));
                p.setFechasuceso(rs.getString(7));
                p.setTurno(rs.getString(8));
                p.setLugar(rs.getString(9));
                p.setCorreou(rs.getString(10));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    
    public int AgregarNuevoReporte(Reporte p){
        String sql="insert into reporte(idReporte, Nombres, Descripcion, Precio, Cantreporte, Imagen, Fechasuceso, Turno, Lugar, Correou)values(?,?,?,?,?,?,?,?,?,?)";
        try {
            ps=getConnection().prepareStatement(sql);
            ps.setInt(1, p.getId());
            ps.setString(2, p.getNombres());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getCantreporte());
            ps.setString(6, p.getImagen());
            ps.setString(7, p.getFechasuceso());
            ps.setString(8, p.getTurno());
            ps.setString(9, p.getLugar());
            ps.setString(10, p.getCorreou());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
}
