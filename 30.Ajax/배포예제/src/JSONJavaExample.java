
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Java에서 json-simple 라이브러리를 이용한 JSON 파싱
 * https://code.google.com/archive/p/json-simple 에서 다운로드
 * 주로 서버파트에서 사용
 * @author 김기정
 */
@SuppressWarnings("unchecked")
public class JSONJavaExample {
	
	public static void main(String[] args) throws ParseException {
		
		// JSONObject(아빠는 HashMap)를 이용한 JSON String 변환
		// 주로 서버에서 클라이언트로 문자열 전송 시 사용
		JSONObject object = new JSONObject();
		object.put("name", "김기정");
		object.put("age", 20);
		object.put("address", "서울시 중랑구 신내로");
		
		// 서버에서 클라이언트로 전송하기 위해 문자열로 형변환
		String string = object.toJSONString();
		System.out.println(string);
		
		JSONArray array = new JSONArray();
//		array.add(new Book());
		array.add("Java");
		array.add("SQL");
		array.add("Servlet");
		array.add("JSP");
		System.out.println(array.toJSONString());
		
		object.put("skills", array);
		
		string = object.toJSONString();
		System.out.println(string);
		
		
		// String -> Object로 형변환
		// 주로 브라우저에서(Ajax) 수신한 문자열을 파싱하기 위해 Object로 형변환
		
		JSONParser parser = new JSONParser();
		JSONObject student = (JSONObject) parser.parse(string);
		System.out.println(student.get("name"));
		System.out.println(student.get("age"));
		System.out.println(student.get("address"));
		
		JSONArray skills = (JSONArray) student.get("skills");
		for (Object skill : skills) {
			System.out.println(skill);
		}
	}

}
