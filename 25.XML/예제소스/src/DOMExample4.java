
import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

/**
 *  DOM 규약을 준수한 JAXP 파서 기반 XML 처리
 *  노드 수정
 */
public class DOMExample4 {
	public static void main(String[] args) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder parser = factory.newDocumentBuilder();

		String xmlPath = "src/bookList.xml";
		Document document = parser.parse(xmlPath);
		Element booklistElement = document.getDocumentElement();

		// 첫번째 책 제목 수정하기
		Element bookElement = (Element) booklistElement.getFirstChild();
		Element titleElement = (Element) bookElement.getFirstChild();
		Text titleText = (Text) titleElement.getFirstChild();
		titleText.setNodeValue("성공을 위한 열쇠");
		// titleText.setData("성공을 위한 열쇠");
		System.out.println("[디버깅]: 수정후 제목: " + titleText.getNodeValue());

		// 속성 수정하기
		bookElement.setAttribute("kind", "코믹");
		System.out.println("[디버깅]: 수정후 종류: " + bookElement.getAttribute("kind"));
		

		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, "bookList.dtd");
				
		DOMSource source = new DOMSource(document);
		StreamResult result = new StreamResult(new File("bookList_2.xml"));
		transformer.transform(source, result);
		System.out.println("[디버깅]: 파일 저장 완료!!");	
	}
}
