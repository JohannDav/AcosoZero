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
import java.io.ByteArrayOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;

@WebServlet("/ReporteServletActionInsertReport")
public class GeneratePdfServlet extends HttpServlet {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/bdsfrentas";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "n0m3l0";
    
    private static final String fromEmail = "acosozer0batiz@gmail.com";
    private static final String emailPassword = "zhmakgmcvqtsjqoj";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");

        String correo = request.getParameter("correo");
        String reportId = request.getParameter("idReporte");

        String nombresReporte = "";
        String descripcion = "";
        String precio = "";
        String cantreporte = "";

        String boleta = "";
        String nombresUsuario = "";
        String direccion = "";
        String email = "";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sqlReporte = "SELECT Nombres, Descripcion, Precio, Cantreporte FROM reporte WHERE idReporte = ?";
            
            try (PreparedStatement statementReporte = connection.prepareStatement(sqlReporte)) {
                statementReporte.setString(1, reportId);

                try (ResultSet resultSetReporte = statementReporte.executeQuery()) {
                    if (resultSetReporte.next()) {
                        nombresReporte = resultSetReporte.getString("Nombres");
                        descripcion = resultSetReporte.getString("Descripcion");
                        precio = resultSetReporte.getString("Precio");
                        cantreporte = resultSetReporte.getString("Cantreporte");
                    }
                }
            }

            String sqlUsuario = "SELECT Boleta, Nombres, Direccion, Email, Password FROM usuario WHERE Email = ?";

            try (PreparedStatement statementUsuario = connection.prepareStatement(sqlUsuario)) {
                statementUsuario.setString(1, correo);

                try (ResultSet resultSetUsuario = statementUsuario.executeQuery()) {
                    if (resultSetUsuario.next()) {
                        boleta = resultSetUsuario.getString("Boleta");
                        nombresUsuario = resultSetUsuario.getString("Nombres");
                        direccion = resultSetUsuario.getString("Direccion");
                        email = resultSetUsuario.getString("Email");

                        String fileName = "Reporte_Acoso_" + nombresUsuario + "_" + boleta + ".pdf";
                        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error en la conexión a la base de datos", e);
        }

        byte[] pdfData = null;

        try {
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();

            Date fechaActual = new Date();
            SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
            String fechaFormateada = formatoFecha.format(fechaActual);

            PdfPTable tableUsuario = new PdfPTable(4);
            tableUsuario.setWidthPercentage(100);

            PdfPCell cellDatosUsuario = new PdfPCell(new Paragraph("Datos del Usuario"));
            cellDatosUsuario.setColspan(2);
            cellDatosUsuario.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cellFecha = new PdfPCell(new Paragraph("Fecha"));
            PdfPCell cellFechaValor = new PdfPCell(new Paragraph(fechaFormateada));

            tableUsuario.addCell(cellDatosUsuario);
            tableUsuario.addCell(cellFecha);
            tableUsuario.addCell(cellFechaValor);

            tableUsuario.addCell(new PdfPCell(new Paragraph("BOLETA:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(boleta)));
            tableUsuario.addCell(new PdfPCell(new Paragraph("Nombre:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(nombresUsuario)));

            tableUsuario.addCell(new PdfPCell(new Paragraph("Dirección:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(direccion)));
            tableUsuario.addCell(new PdfPCell(new Paragraph("Email:")));
            tableUsuario.addCell(new PdfPCell(new Paragraph(email)));

            document.add(tableUsuario);

            Paragraph paragraphReporte = new Paragraph();
            PdfPTable tableReporte = new PdfPTable(4);
            tableReporte.setWidthPercentage(100);

            PdfPCell cellDatosReporte = new PdfPCell(new Paragraph("Datos del Reporte"));
            cellDatosReporte.setColspan(4);
            cellDatosReporte.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cellNombreReporte = new PdfPCell(new Paragraph("Nombre del Reporte"));
            PdfPCell cellNombreReporteValor = new PdfPCell(new Paragraph(nombresReporte));

            PdfPCell cellDescripcion = new PdfPCell(new Paragraph("Descripción"));
            PdfPCell cellDescripcionValor = new PdfPCell(new Paragraph(descripcion));

            PdfPCell cellPrecio = new PdfPCell(new Paragraph("Lugar"));
            PdfPCell cellPrecioValor = new PdfPCell(new Paragraph(String.valueOf(precio)));

            PdfPCell cellCantreporte = new PdfPCell(new Paragraph("Turno"));
            PdfPCell cellCantreporteValor = new PdfPCell(new Paragraph(String.valueOf(cantreporte)));

            tableReporte.addCell(cellDatosReporte);
            tableReporte.addCell(cellNombreReporte);
            tableReporte.addCell(cellNombreReporteValor);
            tableReporte.addCell(cellDescripcion);
            tableReporte.addCell(cellDescripcionValor);
            tableReporte.addCell(cellPrecio);
            tableReporte.addCell(cellPrecioValor);
            tableReporte.addCell(cellCantreporte);
            tableReporte.addCell(cellCantreporteValor);

            document.add(tableReporte);
            document.add(paragraphReporte);

            document.close();

            pdfData = baos.toByteArray();
        } catch (Exception e) {
            throw new ServletException("Error al generar el PDF", e);
        }

        sendEmailWithAttachment("morales.munoz.mily@gmail.com", "Reporte Generado", "Adjunto se encuentra el reporte generado.", pdfData);

        response.getOutputStream().write(pdfData);
    }

    private void sendEmailWithAttachment(String toEmail, String subject, String messageBody, byte[] attachmentData) throws ServletException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, emailPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);

            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(messageBody);

            MimeBodyPart attachmentPart = new MimeBodyPart();
            DataSource source = new ByteArrayDataSource(attachmentData, "application/pdf");
            attachmentPart.setDataHandler(new DataHandler(source));
            attachmentPart.setFileName("Reporte.pdf");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            multipart.addBodyPart(attachmentPart);

            message.setContent(multipart);

            Transport.send(message);
        } catch (MessagingException e) {
            throw new ServletException("Error al enviar el correo electrónico", e);
        }
    }
}
