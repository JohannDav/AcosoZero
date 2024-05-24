package paquete;
public class Reporte {
    private int idReporte;
    private String nombres;
    private String descripcion;
    private double precio;
    private int cantreporte;
    private String imagen;
    private String fechasuceso;

    public Reporte() {
    }

    public Reporte(int idReporte, String nombres, String descripcion, double precio, int cantreporte, String imagen, String fechasuceso) {
        this.idReporte = idReporte;
        this.nombres = nombres;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantreporte = cantreporte;
        this.imagen = imagen;
        this.fechasuceso = fechasuceso;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
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
}