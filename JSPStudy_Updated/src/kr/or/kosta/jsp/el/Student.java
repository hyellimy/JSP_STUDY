package kr.or.kosta.jsp.el;
/**
 * 학생 정보 
 * @author 이혜림
 */
public class Student {

	
	private String name;
	private Dog dog;
	
	
	public Student() {
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Dog getDog() {
		return dog;
	}


	public void setDog(Dog dog) {
		this.dog = dog;
	}


	@Override
	public String toString() {
		return "Student [name=" + name + ", dog=" + dog + "]";
	}

}
