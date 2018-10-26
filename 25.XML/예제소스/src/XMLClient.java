import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.Socket;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

public class XMLClient {
	
	boolean stop;
	DocumentBuilderFactory parserFactory;
	DocumentBuilder parser;
	
	public XMLClient() {
		try {
			parserFactory = DocumentBuilderFactory.newInstance();
			parser = parserFactory.newDocumentBuilder();			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void startUp() {
		try {		
			System.out.println("XMLClient Start");
			Socket socket = new Socket("localhost", 7777);
			
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());
			
			String xmlMessage = "<?xml version='1.0' encoding='utf-8'?>"+
			                    "<users>"+
					            "<user>"+
			                    "<id>bangry</id>"+
					            "<name>김기정</name>"+
			                    "<age>10</age>"+
					            "</user>"+
			                    "<user>"+
					            "<id>killer</id>"+
			                    "<name>김킬러</name>"+
					            "<age>20</age>"+
			                    "</user>"+
					            "</users>" ;
			out.writeUTF(xmlMessage);
			
			DataInputStream in = new DataInputStream(socket.getInputStream());
			String responseXml = in.readUTF();
			
			System.out.println("서버에서 XML 수신");
			System.out.println(responseXml);
			
			Document document = toXmlDocument(responseXml);
			Element rootElement = document.getDocumentElement();
			System.out.println(rootElement.getNodeType());
			System.out.println(rootElement.getNodeName());
			System.out.println(rootElement.getNodeValue());
			socket.close();
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	// String -> DOM 변환
	public Document toXmlDocument(String text){
		Document document = null;
		try {
			StringReader stringReader = new StringReader(text);
			InputSource xmlInputSource = new InputSource(stringReader);
			document = parser.parse(xmlInputSource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return document;
	}
		
	// DOM -> String 변환
	public String toString(Document document){
		String text = null;
		try {
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			Source xmlSource = new DOMSource(document);
			StringWriter stringWriter = new StringWriter();
			Result xmlResult = new StreamResult(stringWriter);
			transformer.transform(xmlSource, xmlResult);
			text = stringWriter.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return text;
	}
	
	public static void main(String[] args) {
		XMLClient client = new XMLClient();
		client.startUp();
	}

}
