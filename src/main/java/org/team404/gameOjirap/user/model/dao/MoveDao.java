package org.team404.gameOjirap.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.user.model.vo.User;

@Repository("MoveDao")
public class MoveDao {
	//★★★★★★MemberServiceImpl로부터 받은 값을 처리해서 Controller로 넘기는 파트임!

	//마이바티스 연결
	@Autowired		//@Autowired를 통해 의존성(DI)주입됨 => root-context.xml 에서 생성한 객체와 자동 연결됨=> mapper, config, DB까지 모두 연결됨
	private SqlSessionTemplate session;	


	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectLogin", user_id);	
	}


}//class close











