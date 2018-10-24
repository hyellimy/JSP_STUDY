package kr.or.kosta.jsp.dao;

import java.lang.reflect.Method;
import java.util.Hashtable;
import java.util.List;

import javax.sql.DataSource;

import oracle.net.aso.f;

public class JdbcDaoFactory2 extends DaoFactory {
	
	private Hashtable<String, Object> daos;
	
	private String[] daoNames = {"kr.or.kosta.jsp.dao.JdbcUserDao"};
	
	public JdbcDaoFactory2() {
		daos = new Hashtable<String, Object>();
		
		for (String className : daoNames) {
			try {
				Object dao = Class.forName(className).newInstance();
				addDataSource(dao);
				daos.put(className, dao);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public UserDao getUserDao() {
		return (UserDao)daos.get("kr.or.kosta.jsp.dao.JdbcUserDao");
	}
	
	private void addDataSource(Object dao) {
		Class cls = dao.getClass();
		// 동적 메소드호출
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			method.invoke(dao, getDataSource());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	public BarDao getBarDao() {...};
//	public FooDao getFooDao() {...};
	
	public static void main(String[] args) throws Exception {
		DaoFactory factory = new JdbcDaoFactory2();
		UserDao dao = factory.getUserDao();
		List<User> list = dao.listAll();
		for (User user : list) {
			System.out.println(user.toString());
		}
		
	}

}
