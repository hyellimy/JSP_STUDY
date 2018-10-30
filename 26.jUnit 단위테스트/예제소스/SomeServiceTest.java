package test.kr.or.kosta.shoppingmall;

/** 
 * 단위테스트를 위해 Application 클래스 정의
 */
public class SomeServiceTest {
	
	public static void main(String[] args) {
		SomeServiceImpl service = new SomeServiceImpl();
		int sum = service.sum(10, 20);
		System.out.println(sum);
	}

}
