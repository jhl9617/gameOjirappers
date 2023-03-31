package org.team404.gameOjirap.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.user.model.dao.InoutDao;
import org.team404.gameOjirap.user.model.vo.User;

@Service("inoutService")	
public class InoutServiceImpl implements InoutService{

	@Autowired			//자동 DI 처리됨 : 자동 객체 생성되어 연결된다.
	InoutDao inoutDao;

	@Override
	public User loginMethod(User user) {
		return inoutDao.loginMethod(user);
	}
	
	@Override
	public User selectUser(String user_id) {
		return inoutDao.selectUser(user_id);
	}

	@Override
	public ArrayList<User> selectUserList() {
		return inoutDao.selectUserList();
	}

	@Override
	public int userInsertMethod(User user) {
		return inoutDao.userInsertMethod(user);
	}

	
	
	
	
	@Override
	public int userDeleteMethod(String user_id) {
		return inoutDao.userDeleteMethod(user_id);
	}


	@Override
	public int levelMethod(User user_level) {
		return inoutDao.levelMethod(user_level);
	}

	@Override
	public int selectDupCheckId(String user_id) {
		return inoutDao.selectDupCheckId(user_id);
	}

	@Override
	public int selectDupCheckNick(String user_nickname) {
		return inoutDao.selectDupCheckNick(user_nickname);
	}

	@Override
	public int checkanswer(String confirm_answer) {
		return inoutDao.checkanswer(confirm_answer);
	}

	@Override
	public int updateLoginok(User user) {
		return inoutDao.updateLoginok(user);
	}


	
}//class close









