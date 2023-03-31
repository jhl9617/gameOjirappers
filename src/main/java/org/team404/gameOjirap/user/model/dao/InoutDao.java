package org.team404.gameOjirap.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.user.model.vo.User;

@Repository("InoutDao")
public class InoutDao {
	//★★★★★★MemberServiceImpl로부터 받은 값을 처리해서 Controller로 넘기는 파트임!
//	String NAMESPACE = "userMapper";

	@Autowired	
	private SqlSessionTemplate session;	

	//로그인요청처리용
	public User loginMethod(User user) {
		
		return session.selectOne("userMapper.loginMethod", user);
	}
	
	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectUser", user_id);	
	}

	
	
	public ArrayList<User> selectUserList() {
		List<User> list = session.selectList("userMapper.selectUserList");	
		
		return (ArrayList<User>)list;
	}
	

	
	public int selectDupCheckId(String user_id) {
		return session.selectOne("userMapper.selectDupCheckId", user_id);	
	}
	
	public int selectDupCheckNick(String user_nickname) {
		return session.selectOne("userMapper.selectDupCheckId", user_nickname);	
	}

	public int userDeleteMethod(String user_id) {
		return session.delete("deleteUser", user_id);
	}


	public int userInsertMethod(User user) {
		return session.insert("userMapper.insertMember", user);
	}

	public int levelMethod(User user_level) {
		return session.insert("userMapper.levelMethod", user_level);
	}

	public int checkanswer(User confirm_answer) {
		return session.insert("userMapper.checkanswer", confirm_answer);
	}


	public int checkanswer(String confirm_answer) {
		return session.insert("userMapper.checkanswer", confirm_answer);
	}

	public int updateLoginok(User user) {
		return session.update("userMapper.updateLoginok", user);
	}



}//class close











