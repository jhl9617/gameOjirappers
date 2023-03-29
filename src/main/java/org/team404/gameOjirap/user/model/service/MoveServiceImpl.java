package org.team404.gameOjirap.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.user.model.dao.MoveDao;
import org.team404.gameOjirap.user.model.vo.User;

@Service("MoveService")	
public class MoveServiceImpl implements MoveService{

	@Autowired		
	MoveDao moveDao;

	@Override
	public User selectUser(String user_id) {
		return moveDao.selectUser(user_id);
	}
	
	
	
	
	
}//class close









