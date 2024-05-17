package PDFs;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ReporteServletActionInsertReport")
public class GeneratePdfServlet extends HttpServlet {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/bdsfrentas";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "n0m3l0";

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer el tipo de contenido como PDF
        response.setContentType("application/pdf");

        // Establecer el encabezado Content-Disposition para descargar el PDF

        // Obtener el correo electrónico del usuario desde la solicitud
        String correo = request.getParameter("correo");
        // Obtener el ID del reporte desde la solicitud
        String reportId = request.getParameter("idReporte");

        // Variables para almacenar los datos del reporte
        String nombresReporte = "";
        String descripcion = "";
        String precio = "";
        String cantreporte = "";

        // Variables para almacenar los datos del usuario
        String boleta = "";
        String nombresUsuario = "";
        String direccion = "";
        String email = "";

        // Establecer la conexión a la base de datos
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            // Crear la consulta SQL para obtener los datos del reporte
            String sqlReporte = "SELECT Nombres, Descripcion, Precio, Cantreporte FROM reporte WHERE idReporte = ?";
            
            // Preparar la consulta para el reporte
            try (PreparedStatement statementReporte = connection.prepareStatement(sqlReporte)) {
                statementReporte.setString(1, reportId);

                // Ejecutar la consulta del reporte y obtener el resultado
                try (ResultSet resultSetReporte = statementReporte.executeQuery()) {
                    // Verificar si se encontró un resultado para el reporte
                    if (resultSetReporte.next()) {
                        // Asignar los valores obtenidos a las variables del reporte
                        nombresReporte = resultSetReporte.getString("Nombres");
                        descripcion = resultSetReporte.getString("Descripcion");
                        precio = resultSetReporte.getString("Precio");
                        cantreporte = resultSetReporte.getString("Cantreporte");
                        
                        
                    }
                }
            }

            // Crear la consulta SQL para obtener los datos del usuario por correo electrónico
            String sqlUsuario = "SELECT Boleta, Nombres, Direccion, Email, Password FROM usuario WHERE Email = ?";

            // Preparar la consulta para el usuario
            try (PreparedStatement statementUsuario = connection.prepareStatement(sqlUsuario)) {
                statementUsuario.setString(1, correo);

                // Ejecutar la consulta del usuario y obtener el resultado
                try (ResultSet resultSetUsuario = statementUsuario.executeQuery()) {
                    // Verificar si se encontró un resultado para el usuario
                    if (resultSetUsuario.next()) {
                        // Asignar los valores obtenidos a las variables del usuario
                        boleta = resultSetUsuario.getString("Boleta");
                        nombresUsuario = resultSetUsuario.getString("Nombres");
                        direccion = resultSetUsuario.getString("Direccion");
                        email = resultSetUsuario.getString("Email");

        // Obtener el nombre del usuario desde la solicitud

        // Configurar el nombre del archivo PDF con el nombre del usuario y su BOLETA
        String fileName = "Reporte_Acoso_" + nombresUsuario + "_" + boleta + ".pdf";

        // Establecer el encabezado Content-Disposition para descargar el PDF con el nombre del archivo
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error en la conexión a la base de datos", e);
        }

        // Generar el PDF con los datos obtenidos del reporte y del usuario
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            Date fechaActual = new Date();
            SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
            String fechaFormateada = formatoFecha.format(fechaActual);


            // Crear la tabla para los datos del usuario
            PdfPTable tableUsuario = new PdfPTable(4);
            tableUsuario.setWidthPercentage(100);

            // Primera fila
            PdfPCell cellDatosUsuario = new PdfPCell(new Paragraph("Datos del Usuario"));
            cellDatosUsuario.setColspan(2);
            cellDatosUsuario.setHorizontalAlignment(Element.ALIGN_CENTER); // Centrar horizontalmente
            PdfPCell cellFecha = new PdfPCell(new Paragraph("Fecha"));
            PdfPCell cellFechaValor = new PdfPCell(new Paragraph(fechaFormateada));

            // Agregar celdas a la primera fila
            tableUsuario.addCell(cellDatosUsuario);
            tableUsuario.addCell(cellFecha);
            tableUsuario.addCell(cellFechaValor);

            // Segunda fila
            tableUsuario.addCell(new PdfPCell(new Paragraph("BOLETA:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(boleta)));
            tableUsuario.addCell(new PdfPCell(new Paragraph("Nombre:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(nombresUsuario)));

            // Tercera fila
            tableUsuario.addCell(new PdfPCell(new Paragraph("Dirección:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(direccion)));
            tableUsuario.addCell(new PdfPCell(new Paragraph("Email:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(email)));

            // Agregar la tabla al documento
            document.add(tableUsuario);
            
            // Agregar los datos del reporte al PDF
            Paragraph paragraphReporte = new Paragraph();
                      PdfPTable tableReporte = new PdfPTable(4);
            tableReporte.setWidthPercentage(100);

            // Primera fila
            PdfPCell cellDatosReporte = new PdfPCell(new Paragraph("Datos del Reporte"));
            cellDatosReporte.setColspan(4);
            cellDatosReporte.setHorizontalAlignment(Element.ALIGN_CENTER); // Centrar horizontalmente
            PdfPCell cellNombreReporte = new PdfPCell(new Paragraph("Nombre del Reporte"));
            PdfPCell cellNombreReporteValor = new PdfPCell(new Paragraph(nombresReporte));

            // Segunda fila
            PdfPCell cellDescripcion = new PdfPCell(new Paragraph("Descripción"));
            PdfPCell cellDescripcionValor = new PdfPCell(new Paragraph(descripcion));

            // Tercera fila
            PdfPCell cellPrecio = new PdfPCell(new Paragraph("Precio"));
            PdfPCell cellPrecioValor = new PdfPCell(new Paragraph(String.valueOf(precio)));

            // Cuarta fila
            PdfPCell cellCantreporte = new PdfPCell(new Paragraph("Cantreporte"));
            PdfPCell cellCantreporteValor = new PdfPCell(new Paragraph(String.valueOf(cantreporte)));

            // Agregar celdas a la tabla
            tableReporte.addCell(cellDatosReporte);
            tableReporte.addCell(cellNombreReporte);
            tableReporte.addCell(cellNombreReporteValor);
            tableReporte.addCell(cellDescripcion);
            tableReporte.addCell(cellDescripcionValor);
            tableReporte.addCell(cellPrecio);
            tableReporte.addCell(cellPrecioValor);
            tableReporte.addCell(cellCantreporte);
            tableReporte.addCell(cellCantreporteValor);

            // Agregar la tabla al documento
            document.add(tableReporte);

            document.add(paragraphReporte);
// Obtener la fecha actual


            document.close();
        } catch (Exception e) {
            throw new ServletException("Error al generar el PDF", e);
        }
    }
}
