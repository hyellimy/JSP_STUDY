package kr.or.kosta.jsp;

/**
 * JavaBean
 */
public class Account {
	
	public  static final String bankName = "하나은행";

	private String accountNum ;
	private String accountOwner;
	private int passwd;
	private long restMoney;

	public Account(){
		this(null, null);
	}

	public Account(String accountNum, String accountOwner){
		//this.accountNum = accountNum;
		//this.accountOwner = accountOwner;
		this(accountNum, accountOwner, 0, 0);
	}

	public Account(String accountNum, String accountOwner, int passwd, long restMoney){
		this.accountNum = accountNum;
		this.accountOwner = accountOwner;
		this.passwd = passwd;
		this.restMoney = restMoney;
	}

	public void setAccountNum(String accountNum){
		this.accountNum = accountNum;
	}

	public String getAccountNum(){
		return accountNum;	
	}

	public void setAccountOwner(String accountOwner){
		this.accountOwner = accountOwner;
	}

	public String getAccountOwner(){
		return accountOwner;	
	}

	public void setRestMoney(long restMoney){
		this.restMoney = restMoney;
	}

	public void setPasswd(int passwd){
		this.passwd = passwd;
	}

	public int getPasswd(){
		return passwd;
	}


	// 인스턴스 메소드
	public long deposit(long money){
		restMoney += money;
		return restMoney;
	}

	public long withdraw(long money){
		restMoney -= money;
		return restMoney;
	}

	public long getRestMoney(){
		return restMoney;
	}

	public boolean checkPasswd(int pw){
		return passwd == pw;
	}
	
	@Override
	public String toString() {
		return getAccountNum() + "\t" + getAccountOwner() + "\t" + "****" + "\t" + getRestMoney();
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean eq = false;
		if(obj instanceof Account) {
			eq = toString().equals(obj.toString());
		}
		return eq;
	}
}
