package org.team404.gameOjirap.user.model.service;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.user.model.dao.InOutDao;

@Service("inOutService")	
public class InOutServiceImpl implements InOutService{

	@Autowired			//자동 DI 처리됨 : 자동 객체 생성되어 연결된다.
	InOutDao inOutDao;
	
	
	
	@Override
	public User loginMethod(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userDeleteMethod(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userInsertMethod(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int levelMethod(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkanswer(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectDupCheckId(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectDupCheckNick(String user_nickname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkanswer(String confirm_answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLoginok(User user) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}//class close









