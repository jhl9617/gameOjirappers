package org.team404.gameOjirap.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.member.model.vo.User;

import java.util.ArrayList;

@Repository("memberDao")  //xml 에 자동 등록됨
public class UserDao {
	//마이바티스 매퍼 파일에 쿼리문 별도로 작성함
	//root-context.xml 에 생성된 마이바티스 매퍼 연결 객체를 사용함
	@Autowired  //root-context.xml 에서 생성한 객체와 자동 연결
	private SqlSessionTemplate session;  //의존성 주입됨(DI)
		
	public User selectLogin(User member) {
		return session.selectOne("memberMapper.selectLogin", member);
	}

	
	public ArrayList<User> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int insertMember(User member) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int updateMember(User member) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}
}
