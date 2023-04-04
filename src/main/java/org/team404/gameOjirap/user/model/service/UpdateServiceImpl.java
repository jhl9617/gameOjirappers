package org.team404.gameOjirap.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.user.model.dao.InoutDao;
import org.team404.gameOjirap.user.model.dao.UpdateDao;
import org.team404.gameOjirap.user.model.vo.User;

@Service("UpdateService")	
public class UpdateServiceImpl implements UpdateService{

	@Autowired			//자동 DI 처리됨 : 자동 객체 생성되어 연결된다.
	UpdateDao updateDao;

	@Override
	public int updateUser(User user) {
		return updateDao.updateUser(user);
	}

	
}//class close









