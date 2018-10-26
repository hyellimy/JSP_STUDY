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
 *  노드 추가 및 파일 저장
 */
public class DOMExample3 {
	public static void main(String[] args) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder parser = factory.newDocumentBuilder();
		String xmlPath = "src/bookList.xml";
		Document document = parser.parse(xmlPath);
		Element booklistElement = document.getDocumentElement();
		
		// book 엘리먼트 객체 생성
		Element bookElement = document.createElement("book");

		// book 엘리먼트 속성 추가
		bookElement.setAttribute("kind", "소설");

		// 엘리먼트 객체 생성 및 자식노드 추가
		Element titleElement = document.createElement("title");
		Text titleText = document.createTextNode("시인과도둑");
		titleElement.appendChild(titleText);

		Element authorElement = document.createElement("author");
		Text authorText = document.createTextNode("김도둑");
		authorElement.appendChild(authorText);

		Element publisherElement = document.createElement("publisher");
		Text publisherText = document.createTextNode("시인출판사");
		publisherElement.appendChild(publisherText);

		Element priceElement = document.createElement("price");
		Text priceText = document.createTextNode("9000");
		priceElement.appendChild(priceText);

		bookElement.appendChild(titleElement);
		bookElement.appendChild(authorElement);
		bookElement.appendChild(publisherElement);
		bookElement.appendChild(priceElement);
		//bookElement.insertBefore(newChild, refChild);

		booklistElement.appendChild(bookElement);

		System.out.println("[디버깅]: 노드 추가 완료!");
		System.out.println("[디버깅]: 추가 후 book 엘리먼트 갯수: " + booklistElement.getChildNodes().getLength());
		
		
		// XSL 변환기를 이용한 메모리상의 DOM 트리를 XML 파일로 저장
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, "bookList.dtd");
		
		// DOMSource 객체 생성
		DOMSource source = new DOMSource(document);
		
		// 로컬 파일 출력
		StreamResult result = new StreamResult(new File("bookList_1.xml"));
		// 네트워크 출력
		//Result result = new StreamResult(socket.getOutputStream());
				
		transformer.transform(source, result);
		System.out.println("[디버깅]: 파일 저장 완료!!");	
	}
}





