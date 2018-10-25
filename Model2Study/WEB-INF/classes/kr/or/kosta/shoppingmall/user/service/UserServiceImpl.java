package kr.or.kosta.shoppingmall.user.service;

import java.util.List;

import kr.or.kosta.shoppingmall.common.dao.DaoFactory;
import kr.or.kosta.shoppingmall.common.dao.JdbcDaoFactory;
import kr.or.kosta.shoppingmall.user.dao.JdbcUserDao;
import kr.or.kosta.shoppingmall.user.dao.UserDao;
import kr.or.kosta.shoppingmall.user.domain.User;

public class UserServiceImpl implements UserService {
	
	String mapperLocation = "C:/KOSTA187/workspace/Model2Study/WebContent/WEB-INF/dao-mapper.properties";
	DaoFactory factory = new JdbcDaoFactory(mapperLocation);
	
	UserDao userDao;
	
	
	@Override
	public User search(String id) throws Exception {
		return null;
	}

	@Override
	public List<User> list() throws Exception {
		userDao = (UserDao)factory.getDao(JdbcUserDao.class);
		return userDao.listAll();
	}

}





