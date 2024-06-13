package PDFs;

import com.itextpdf.text.BaseColor;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
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
import java.util.logging.Level;
import java.util.logging.Logger;
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
        String turno = "";
        String lugar = "";
        String fechasuceso = "";

        String boleta = "";
        String nombresUsuario = "";
        String direccion = "";
        String email = "";

try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
    String sqlReporte = "SELECT Nombres, Descripcion, Precio, Cantreporte, Imagen, Turno, Lugar, Fechasuceso FROM reporte WHERE idReporte = ?";
    
    try (PreparedStatement statementReporte = connection.prepareStatement(sqlReporte)) {
        statementReporte.setString(1, reportId);

        try (ResultSet resultSetReporte = statementReporte.executeQuery()) {
            if (resultSetReporte.next()) {
                nombresReporte = resultSetReporte.getString("Nombres");
                descripcion = resultSetReporte.getString("Descripcion");
                precio = resultSetReporte.getString("Precio");
                cantreporte = resultSetReporte.getString("Cantreporte");
                turno = resultSetReporte.getString("Turno");
                lugar = resultSetReporte.getString("Lugar");
                fechasuceso = resultSetReporte.getString("Fechasuceso");
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
    SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
    String fechaFormateada = formatoFecha.format(fechaActual);
    String horaFormateada = formatoHora.format(fechaActual);

    // Agregar imagen
    String imageUrl = "https://lh3.googleusercontent.com/drive-storage/AJQWtBN3dVlDW5VRD2QNqPyIbR2Yonw5a7gVa87aoFuBZBSDbBkHx8RSXkMmzjQUkPozXW1Hj9dSI0XiNLFk95N7ICdqiW5pXshiebiT0UIgjD-EjWk=h360";  // Proporciona la ruta a la imagen
    Image image = Image.getInstance(imageUrl);
    image.scaleToFit(100, 100);
    image.setAbsolutePosition(50, 750);  // Ajusta la posición según sea necesario
    document.add(image);

    // Título del reporte
    Paragraph titulo = new Paragraph("Reporte de Acoso",
            FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, BaseColor.BLACK));
    titulo.setAlignment(Element.ALIGN_CENTER);
    titulo.setSpacingAfter(20);
    document.add(titulo);

    // Tabla de datos del usuario
    PdfPTable tableUsuario = new PdfPTable(4);
    tableUsuario.setWidthPercentage(100);
    tableUsuario.setSpacingBefore(10f);
    tableUsuario.setSpacingAfter(10f);

    PdfPCell cellDatosUsuario = new PdfPCell(new Paragraph("Datos del Usuario"));
    cellDatosUsuario.setColspan(4);
    cellDatosUsuario.setHorizontalAlignment(Element.ALIGN_CENTER);
    cellDatosUsuario.setBackgroundColor(BaseColor.LIGHT_GRAY);
    tableUsuario.addCell(cellDatosUsuario);

    tableUsuario.addCell(new PdfPCell(new Paragraph("Fecha:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(fechaFormateada)));
    tableUsuario.addCell(new PdfPCell(new Paragraph("Hora:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(horaFormateada)));

    tableUsuario.addCell(new PdfPCell(new Paragraph("BOLETA:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(boleta)));
    tableUsuario.addCell(new PdfPCell(new Paragraph("Nombre:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(nombresUsuario)));

    tableUsuario.addCell(new PdfPCell(new Paragraph("Dirección:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(direccion)));
    tableUsuario.addCell(new PdfPCell(new Paragraph("Email:")));
    tableUsuario.addCell(new PdfPCell(new Paragraph(email)));
    document.add(tableUsuario);

    // Tabla de datos del reporte
    PdfPTable tableReporte = new PdfPTable(4);
    tableReporte.setWidthPercentage(100);
    tableReporte.setSpacingBefore(10f);
    tableReporte.setSpacingAfter(10f);

    PdfPCell cellDatosReporte = new PdfPCell(new Paragraph("Datos del Reporte"));
    cellDatosReporte.setColspan(4);
    cellDatosReporte.setHorizontalAlignment(Element.ALIGN_CENTER);
    cellDatosReporte.setBackgroundColor(BaseColor.LIGHT_GRAY);
    tableReporte.addCell(cellDatosReporte);

    tableReporte.addCell(new PdfPCell(new Paragraph("Nombre del Reporte:")));
    tableReporte.addCell(new PdfPCell(new Paragraph(nombresReporte)));
    tableReporte.addCell(new PdfPCell(new Paragraph("Descripción:")));
    tableReporte.addCell(new PdfPCell(new Paragraph(descripcion)));

    tableReporte.addCell(new PdfPCell(new Paragraph("Turno:")));
    tableReporte.addCell(new PdfPCell(new Paragraph(turno)));
    tableReporte.addCell(new PdfPCell(new Paragraph("Lugar:")));
    tableReporte.addCell(new PdfPCell(new Paragraph(lugar)));

    tableReporte.addCell(new PdfPCell(new Paragraph("Fecha del Suceso:")));
    tableReporte.addCell(new PdfPCell(new Paragraph(fechasuceso)));
    document.add(tableReporte);

    document.close();
    pdfData = baos.toByteArray();
} catch (DocumentException e) {
    throw new IOException("Error al generar el PDF", e);
}


        sendEmailWithAttachment("gutierrez.flores.cristian.2006@gmail.com", "Reporte Generado", "Adjunto se encuentra el reporte generado.", pdfData);

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
