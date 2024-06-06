package com.rs.modelo;

import java.io.InputStream;

public class Reporte {
    int id;
    String nombres;    
    String descripcion;
    double precio;
    int cantreporte;
    String imagen; // Cambiado a String para almacenar la ruta o URL de la imagen
    String fechasuceso;
    String turno;
    String lugar;
    String correou;
    
    public Reporte() {
    }

    public Reporte(int id, String nombres, String descripcion, double precio, int cantreporte, String imagen, String fechasuceso, String turno, String lugar, String correou) {
        this.id = id;
        this.nombres = nombres;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantreporte = cantreporte;
        this.imagen = imagen;
        this.fechasuceso = fechasuceso;
        this.turno = turno;
        this.lugar = lugar;
        this.correou = correou;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantreporte() {
        return cantreporte;
    }

    public void setCantreporte(int cantreporte) {
        this.cantreporte = cantreporte;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public String getFechasuceso() {
        return fechasuceso;
    }

    public void setFechasuceso(String fechasuceso) {
        this.fechasuceso = fechasuceso;
    }
    
    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getCorreou() {
        return lugar;
    }

    public void setCorreou(String correou) {
        this.correou = correou;
    }
}
