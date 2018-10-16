package kr.or.kosta.jsp;

import java.io.Serializable;

/**
 * 자바 빈 규약 
 * @author 이혜림
 *
 */
public class Account implements Serializable {

	static {

		System.out.println("초기화 블럭 실행입니다.1");
		System.out.println("초기화 블럭 실행입니다.2");
	}

	public final static String bankName = "하나은행";
	private String accountNum;
	private String accountOwner;
	private int passwd;
	private long restMoney;
	//자바 빈에서는 default는 반드시 있어야 한다. 
	public Account() {
		this(null, null, 0, 0);
	}

	public Account(String accountNum) {
		this.accountNum = accountNum;
	}

	public Account(int passwd) {
		this.passwd = passwd;
	}

	public Account(String accountNum, String accountOwner) {
		this(accountNum, accountOwner, 0, 0);
	}

	public Account(String accountNum, String accountOwner, int passwd, long restMoney) {
		this.accountNum = accountNum;
		this.accountOwner = accountOwner;
		this.passwd = passwd;
		this.restMoney = restMoney;
	}

	
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getAccountNum() {
		return this.accountNum;
	}

	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}

	public String getAccountOwner() {
		return this.accountOwner;
	}

	public void setPasswd(int passwd) {
		this.passwd = passwd;
	}

	public int getPasswd() {
		return this.passwd;
	}

	public void setRestMoney(long restMoney) {
		this.restMoney = restMoney;
	}

	public long getRestMoney() {
		return this.restMoney;
	};

	long deposit(long money) {
		long blank = this.getRestMoney() + money;
		this.setRestMoney(blank);
		return this.getRestMoney();
	};

	long withdraw(long money) {
		this.restMoney -= money;
		return this.restMoney;
	};

	boolean checkPasswd(int pwd) {
		return (this.passwd == pwd);

	};
	
	public String toString() { 
		return getAccountNum() + "\t" + getAccountOwner() + "****" + "\t" + getRestMoney();
	}

	public boolean equals(Object obj) {
		boolean eq = false; // 변수 선언해주기

		if (obj instanceof Account) { // 오브젝트가 어카운트와 같으면,
			eq = toString().equals(obj.toString());
		}
		return eq;
	}


}