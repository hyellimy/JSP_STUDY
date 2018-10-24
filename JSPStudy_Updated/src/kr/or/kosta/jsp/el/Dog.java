package kr.or.kosta.jsp.el;
/**
 * property의 기능을 보완하는 el객체
 * @author 이혜림
 *
 */
public class Dog {
	public String name;
	
	public Dog() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Dog [name=" + name + "]";
	}
	
	

}
