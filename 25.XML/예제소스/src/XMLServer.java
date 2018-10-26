import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.ServerSocket;
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
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class XMLServer {

	boolean stop;
	DocumentBuilderFactory parserFactory;
	DocumentBuilder parser;

	public XMLServer() {
		try {
			parserFactory = DocumentBuilderFactory.newInstance();
			parser = parserFactory.newDocumentBuilder();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void startUp() {
		try {
			ServerSocket ss = new ServerSocket(7777);
			System.out.println("XMLServer Start");
			while (!stop) {
				Socket socket = ss.accept();

				DataInputStream in = new DataInputStream(socket.getInputStream());
				String requestXml = in.readUTF();
				System.out.println("클라이언트로부터 XML 수신");
				System.out.println(requestXml);

				Document document = toXmlDocument(requestXml);
				
				Element rootElement = document.getDocumentElement();
				System.out.println(rootElement.getNodeType());
				System.out.println(rootElement.getNodeName());
				System.out.println(rootElement.getNodeValue());
				
				NodeList users = rootElement.getChildNodes();
				for(int i=0; i<users.getLength(); i++){
					Element user = (Element)users.item(i);
					NodeList childs = user.getChildNodes();
					for(int j=0; j<childs.getLength(); j++){
						Element child = (Element) childs.item(j);
						//child.getNodeName().equals("id");
						String value = child.getFirstChild().getNodeValue();
						System.out.print(value + ",");
					}
					System.out.println();
				}

				DataOutputStream out = new DataOutputStream(
						socket.getOutputStream());
				// XML문자열 에코..
				out.writeUTF(toString(document));

				socket.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// String -> DOM 변환
	public Document toXmlDocument(String text) {
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
	public String toString(Document document) {
		String text = null;
		try {
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
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
		XMLServer server = new XMLServer();
		server.startUp();
	}

}
