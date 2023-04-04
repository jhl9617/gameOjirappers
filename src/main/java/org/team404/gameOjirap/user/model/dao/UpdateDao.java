package org.team404.gameOjirap.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.user.model.vo.User;

@Repository("UpdateDao")
public class UpdateDao {

	@Autowired		
	private SqlSessionTemplate session;		
	
	public int updateUser(User user) {
		return session.update("userMapper.updateuser", user);
	}
	
}
