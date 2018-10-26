import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

/**
 *  DOM 규약을 준수한 JAXP 파서 기반 XML 처리
 *  돔파서 생성 및 노드 검색
 */
public class DOMExample1 {
	
	public static void main(String[] args){
		
		//DOM 파서 Factory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		
		// WhiteSpace를 무시함(XML문서에 문서유형선언이 있어야 유효)
		// DTD문서 또는 XML Schema 문서가 제공되어야 한다.
		factory.setIgnoringElementContentWhitespace(true); 
		// DTD Validation 검사를 하게함 
		factory.setValidating(true); 
		// NameSpace를 해석하도록 함 
		//factory.setNamespaceAware(true); 

		//DOM 파서 생성(JAXP)
		DocumentBuilder parser = null;
		try {
			parser = factory.newDocumentBuilder();
			
			System.out.println("[디버깅]: DOM 파서 로드 완료!");
			System.out.println(parser);
		} catch (ParserConfigurationException e) {
			System.out.println("[디버깅]: " + e);
		}
		
		// DOM API를 이용한 DOM 처리
		String xmlPath = "src/bookList.xml";
		// 로컬 디스크의 XML문서의 구성 요소를 객체 트리로 생성
		Document document = null;
		try {
			document = parser.parse(xmlPath);
			System.out.println("[디버깅]: DOM 트리 객체 생성 완료:" + document);
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 네트워크로 전달되는 XML 문서 파싱
		//URL url = new URL("http://www.xxx.co.kr/bml.xml");
		//Socket socket = new Socket(ip, port);
		//InputStream is = socket.getInputStream();
		//InputStream is = url.openStream();
		//document = parser.parse(is); 

		/** DOM API를 이용한 노드 검색 */

		// Node 최상위 인터페이스의 추상 메소드를 이용한 노드명, 노드 유형, 노드값 읽기 
		System.out.println("노드명 : " + document.getNodeName());
		System.out.println("노드유형 : " + document.getNodeType());
		System.out.println(Node.DOCUMENT_NODE);
		System.out.println("노드값 : " + document.getNodeValue());
		

		// 루트 엘리먼트(booklist) 객체 얻기 
		Element bookListElement = document.getDocumentElement();//documentElement
		System.out.println("노드명 : " + bookListElement.getNodeName());
		System.out.println("엘리먼트명 : " + bookListElement.getTagName());// Element에 추가된 추상메소드
		System.out.println("노드유형 : " + bookListElement.getNodeType());
		System.out.println("노드값 : " + bookListElement.getNodeValue());
		
		// 첫번째 book 엘리먼트 객체 얻기
		Node bookElement = bookListElement.getFirstChild();
		
		Element titleElement = (Element) bookElement.getFirstChild();
		Text titleText = (Text) titleElement.getFirstChild();
		//String title = titleText.getNodeValue();
		String title = titleText.getData();//추가된 메소드
		System.out.println("제목: " + title);

		Element authorElement = (Element) titleElement.getNextSibling();
		Node authorText = authorElement.getFirstChild();
		String author = authorText.getNodeValue();
		System.out.println("저자: " + author);
		
		Node publisherElement = authorElement.getNextSibling();
		String publisher = publisherElement.getFirstChild().getNodeValue();
		System.out.println("출판사: " + publisher);
		
		Node priceElement = publisherElement.getNextSibling();
		String price = priceElement.getFirstChild().getNodeValue();
		System.out.println("가격: " + price);

		// 특정 엘리먼트의 속성 조회
		String kind = ((Element)bookElement).getAttribute("kind");
		System.out.println("분류: "+ kind);
	}
}
