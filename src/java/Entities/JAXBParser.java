/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.*;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.xml.sax.SAXException;

/**
 *
 * @author ttay2
 */
public class JAXBParser implements Serializable {

    public static File XMLtoFile(InputStream is) {
        OutputStream outputStream = null;
        File file = new File("temp.xml");
        try {
            outputStream = new FileOutputStream(file);
            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(JAXBParser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(JAXBParser.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                is.close();
                outputStream.close();
                return file;
            } catch (IOException ex) {
                Logger.getLogger(JAXBParser.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public static Raid parseRaid(File is) {
        try {
            JAXBContext context = JAXBContext.newInstance(JAXBObj.Raid.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            JAXBObj.Raid raid = (JAXBObj.Raid) unmarshaller.unmarshal(is);
            if (raid != null) {
                Raid currRaid = Raid.parseFromJAXB(raid);
                return currRaid;
            }
        } catch (JAXBException ex) {
            Logger.getLogger(JAXBParser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean JAXBValidator(File is) {
        Source xmlFile = new StreamSource(is);
        SchemaFactory schemaFactory = SchemaFactory
                .newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        try {
            Schema schema = schemaFactory.newSchema(new File("Xml/RaidShema.xsd"));
            Validator validator = schema.newValidator();
            validator.validate(xmlFile);
            return true;
        } catch (SAXException e) {

        } catch (IOException e) {

        }
        return false;
    }

    public static File exportToXML(JAXBObj.Raid raid) {
        File os = null;
        try {
            JAXBContext context = JAXBContext.newInstance(JAXBObj.Raid.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(raid, os);
            return os;
        } catch (JAXBException ex) {
            Logger.getLogger(JAXBParser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
