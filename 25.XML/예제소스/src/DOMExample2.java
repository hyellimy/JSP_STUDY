import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

/**
 *  DOM 규약을 준수한 JAXP 파서 기반 XML 처리
 *  돔파서 생성 및 노드 검색
 */
public class DOMExample2 {
	
	public static void main(String[] args) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder parser = factory.newDocumentBuilder();

		String xmlPath = "src/bookList.xml";
		Document document = parser.parse(xmlPath);
		
		// 루트 엘리먼트 취득
		Element booklistElement = document.getDocumentElement();
		
		// 루트 엘리먼트의 모든 자식 노드 검색
		NodeList bookElements = booklistElement.getChildNodes();
		System.out.println("[디버깅]: 자식노드수: " + bookElements.getLength());
		
		for (int i = 0; i < bookElements.getLength(); i++) {
			Node node = bookElements.item(i);
			System.out.println("[디버깅]: " + node.toString());
			System.out.println(node.getNodeName());
		}
		
		System.out.println("------------------------------------------------------");

		// 특정 엘리먼트 이름으로 엘리먼트 검색
		NodeList bookList = document.getElementsByTagName("book");
		System.out.println("[디버깅]: book 엘리먼트 갯수: " + bookList.getLength());
		for (int i = 0; i < bookList.getLength(); i++) {
			Element bookE = (Element) bookList.item(i);
			
			NodeList list = bookE.getChildNodes();
			for(int j=0; j<list.getLength(); j++){
				String name = null;
				String value = null;
				Element e = (Element)list.item(j);
				name = e.getNodeName();
				Text t = (Text)e.getFirstChild();
				value = t.getNodeValue();
				System.out.println(name + ": " + value);
			}
			System.out.println();
		}
		
		// 특정 아이디로 엘리먼트 검색
		Element ee =  document.getElementById("b101");
		System.out.println(ee);
	}
}











