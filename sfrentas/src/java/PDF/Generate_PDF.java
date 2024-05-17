
package PDF;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;

/**
 *
 * @author PC FERRET
 */
public class Generate_PDF {
    public static void main(String[] args) {
        try {
        String file_name="C:\\Users\\PC FERRET\\Documents\\PDFcris\\ReporteAcoso.pdf";
        Document document = new Document();
        
        PdfWriter.getInstance(document, new FileOutputStream(file_name));
        
        document.open();
        
            Paragraph para = new Paragraph("Hola como estas");
            document.add(para);
        
        document.close();
            System.out.println("Acabamos");
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
