package org.team404.gameOjirap.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.user.model.dao.UserDao;
import org.team404.gameOjirap.user.model.vo.User;

@Service("UserService")	
public class UserServiceImpl implements UserService{

	@Autowired			//자동 DI 처리됨 : 자동 객체 생성되어 연결된다.
	UserDao userDao;

	
	@Override		//로그인처리용
	public User selectUser(String user_id) {		
		return userDao.selectUser(user_id);
	}

	@Override		//회원가입처리용
	public int userInsertMethod(User user) {
		return userDao.userInsertMethod(user);
	}

	@Override
	public int selectDupCheckId(String user_id) {
		return userDao.selectDupCheckId(user_id);
	}
	
	@Override
	public int selectDupCheckNick(String user_nickname) {
		return userDao.selectDupCheckNick(user_nickname);
	}
	
	@Override
	public ArrayList<User> selectUserList() {
		return userDao.selectUserList();
	}
	
	@Override
	public int userDeleteMethod(String user_id) {
		return userDao.userDeleteMethod(user_id);
	}
	
	

	
	
	public int updateUser(User user)	{
	return userDao.updateUser(user);
}

	@Override
	public int levelMethod(User user_level) {
		return userDao.levelMethod(user_level);
	}


	@Override
	public int checkanswer(String confirm_answer) {
		return userDao.checkanswer(confirm_answer);
	}

	@Override
	public int updateLoginok(User user) {
		return userDao.updateLoginok(user);
	}


	
}//class close









