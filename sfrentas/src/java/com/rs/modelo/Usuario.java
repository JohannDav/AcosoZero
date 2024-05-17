
package com.rs.modelo;

public class Usuario {
    int id;
    String boleta;
    String Nombres;
    String email;
    String pass;
    String direccion;

    public Usuario() {
    }

    public Usuario(int id, String boleta, String Nombres, String email, String pass, String direccion) {
        this.id = id;
        this.boleta = boleta;
        this.Nombres = Nombres;
        this.email = email;
        this.pass = pass;
        this.direccion = direccion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBoleta() {
        return boleta;
    }

    public void setBoleta(String boleta) {
        this.boleta = boleta;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
}
