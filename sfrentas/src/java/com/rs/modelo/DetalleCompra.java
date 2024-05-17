
package com.rs.modelo;

public class DetalleCompra {
    int id;
    int idcompra;
    int idreporte;
    int cantidad;
    double precioCompra;
    Reporte reporte;

    public DetalleCompra() {
    }

    public DetalleCompra(int id, int idcompra, int idreporte, int cantidad, double precioCompra, Reporte reporte) {
        this.id = id;
        this.idcompra = idcompra;
        this.idreporte = idreporte;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
        this.reporte = reporte;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getIdreporte() {
        return idreporte;
    }

    public void setIdreporte(int idreporte) {
        this.idreporte = idreporte;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public Reporte getReporte() {
        return reporte;
    }

    public void setReporte(Reporte reporte) {
        this.reporte = reporte;
    }
    
    
    
}
