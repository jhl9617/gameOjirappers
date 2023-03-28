package org.team404.gameOjirap.user.model.dao;

import org.apache.catalina.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("InOutDao")
public class InOutDao {
	//★★★★★★MemberServiceImpl로부터 받은 값을 처리해서 Controller로 넘기는 파트임!

	//마이바티스 연결
	@Autowired		//@Autowired를 통해 의존성(DI)주입됨 => root-context.xml 에서 생성한 객체와 자동 연결됨=> mapper, config, DB까지 모두 연결됨
	private SqlSessionTemplate session;	


	public User loginMethod(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	public int userDeleteMethod(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int userInsertMethod(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int levelMethod(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int checkanswer(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectDupCheckId(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectDupCheckNick(String user_nickname) {
		// TODO Auto-generated method stub
		return 0;
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











