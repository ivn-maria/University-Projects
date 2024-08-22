import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

public class XmlToPdf {
    public static void main(String... args) {
        XmlToPdf fOPPdfDemo = new XmlToPdf();
        try {
            fOPPdfDemo.convertToPDF();
        } catch (FOPException | IOException | TransformerException e) {
            e.printStackTrace();
        }
    }

    public void convertToPDF()  throws IOException, FOPException, TransformerException {
        // The XSL FO file
        File xsltFile = new File("./src/main/resources/hotelCatalog.xsl");
        // The XML file
        StreamSource xmlSource = new StreamSource(new File("./src/main/resources/hotelCatalog.xml"));

        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        // The output file
        OutputStream out;
        out = Files.newOutputStream(Paths.get("hotelCatalog.pdf"));

        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            Result res = new SAXResult(fop.getDefaultHandler());

            transformer.transform(xmlSource, res);
        } finally {
            out.close();
        }
    }
}
