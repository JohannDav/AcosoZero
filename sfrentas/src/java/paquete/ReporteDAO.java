/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paquete;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReporteDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;

    public ReporteDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = "jdbc:mysql://localhost:3306/bdsfrentas";
        this.jdbcUsername = "root";
        this.jdbcPassword = "n0m3l0";
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return connection;
    }

    public List<Reporte> listarReportes() {
        List<Reporte> reportes = new ArrayList<>();

        try (Connection connection = getConnection()) {
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
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return reportes;
    }

    public Reporte obtenerReporte(int idReporte) {
        Reporte reporte = null;

        try (Connection connection = getConnection()) {
            String sql = "SELECT * FROM reporte WHERE idReporte = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, idReporte);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String nombres = resultSet.getString("Nombres");
                String descripcion = resultSet.getString("Descripcion");
                double precio = resultSet.getDouble("Precio");
                int cantreporte = resultSet.getInt("Cantreporte");
                String imagen = resultSet.getString("Imagen");
                String fechasuceso = resultSet.getString("Fechasuceso");
                String turno = resultSet.getString("Turno");
                String lugar = resultSet.getString("Lugar");
                String correou = resultSet.getString("Correou");

                reporte = new Reporte(idReporte, nombres, descripcion, precio, cantreporte, imagen, fechasuceso, turno, lugar, correou);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return reporte;
    }

    public void agregarReporte(Reporte reporte) {
        try (Connection connection = getConnection()) {
            String sql = "INSERT INTO reporte (Nombres, Descripcion, Precio, Cantreporte, Imagen, Fechasuceso, Turno, Lugar, Correou) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, reporte.getNombres());
            statement.setString(2, reporte.getDescripcion());
            statement.setDouble(3, reporte.getPrecio());
            statement.setInt(4, reporte.getCantreporte());
            statement.setString(5, reporte.getImagen());
            statement.setString(6, reporte.getFechasuceso());
            statement.setString(7, reporte.getTurno());
            statement.setString(8, reporte.getLugar());
            statement.setString(9, reporte.getCorreou());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void actualizarReporte(Reporte reporte) {
        try (Connection connection = getConnection()) {
            String sql = "UPDATE reporte SET Nombres = ?, Descripcion = ?, Precio = ?, Cantreporte = ?, Imagen = ?, Fechasuceso = ?, Turno = ?, Lugar = ?, Correou = ? WHERE idReporte = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, reporte.getNombres());
            statement.setString(2, reporte.getDescripcion());
            statement.setDouble(3, reporte.getPrecio());
            statement.setInt(4, reporte.getCantreporte());
            statement.setString(5, reporte.getImagen());
            statement.setString(6, reporte.getFechasuceso());
            statement.setString(7, reporte.getTurno());
            statement.setString(8, reporte.getLugar());
            statement.setString(9, reporte.getCorreou());
            statement.setInt(10, reporte.getIdReporte());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void eliminarReporte(int idReporte) {
        try (Connection connection = getConnection()) {
            String sql = "DELETE FROM reporte WHERE idReporte = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, idReporte);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}