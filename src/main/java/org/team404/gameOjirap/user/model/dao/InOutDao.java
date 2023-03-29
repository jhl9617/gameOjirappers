package org.team404.gameOjirap.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.user.model.vo.MyPage;
import org.team404.gameOjirap.user.model.vo.User;

@Repository("InOutDao")
public class InOutDao {
	//★★★★★★MemberServiceImpl로부터 받은 값을 처리해서 Controller로 넘기는 파트임!

	//마이바티스 연결
	@Autowired		//@Autowired를 통해 의존성(DI)주입됨 => root-context.xml 에서 생성한 객체와 자동 연결됨=> mapper, config, DB까지 모두 연결됨
	private SqlSessionTemplate session;	


	public User loginMethod(User user) {
		return session.selectOne("userMapper.loginMethod", user);
	}
	
	public ArrayList<User> selectList() {
		List<User> list = session.selectList("userMapper.selectList");	
		return (ArrayList<User>)list;
	}
	
	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectUser", user_id);	
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

	public int levelMethod(MyPage user_level) {
		return session.insert("userMapper.levelMethod", user_level);
	}

	public int checkanswer(User confirm_answer) {
		return session.insert("userMapper.checkanswer", confirm_answer);
	}


	public int checkanswer(String confirm_answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateLoginok(User user) {
		// TODO Auto-generated method stub
		return 0;
	}




}//class close











