package kr.or.kosta.shoppingmall.user.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.kosta.shoppingmall.common.dao.DaoFactory;
import kr.or.kosta.shoppingmall.common.dao.JdbcDaoFactory;
import kr.or.kosta.shoppingmall.user.domain.User;

public class UserDaoTest {

	public static void main(String[] args) {
		String mapperLocation = "C:/KOSTA187/workspace/Model2Study/WebContent/WEB-INF/dao-mapper.properties";
		DaoFactory factory = new JdbcDaoFactory(mapperLocation);
//		UserDao dao = (UserDao)factory.getDao("kr.or.kosta.shoppingmall.user.dao.JdbcUserDao");
		UserDao dao = (UserDao)factory.getDao(JdbcUserDao.class);
		try {
			
			System.out.println("**** 전체목록 테스트 ****");
			List<User> list =  dao.listAll();
//			List<User> list =  dao.listByPage(2);
//			List<User> list =  dao.listByPage(1, 15);
//			List<User> list =  dao.listByPage(1, 15, null, null);
//			List<User> list =  dao.listByPage(1, 15, "name", "김");
//			List<User> list =  dao.listByPage(new Params(1, 15, "name", "김"));
			for (User user : list) {
				System.out.println(user);				
			}
			
//			int count = dao.countBySearch(null);
//			int count = dao.countBySearch("name", "김");
//			System.out.println("검색수: " + count);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println();
			SQLException ex = (SQLException)e;
			System.out.println(ex.getErrorCode());
		}
		
		
		

	}

}
