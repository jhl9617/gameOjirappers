package org.team404.gameOjirap.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.member.model.dao.MemberDao;
import org.team404.gameOjirap.member.model.vo.Member;

import java.util.ArrayList;

//스프링에서는 서비스 모델 클래스는 서비스 인터페이스를 상속받아서
//만들도록 되어 있음
@Service("memberService")  //xml 자동 등록 처리됨
public class MemberServiceImpl implements MemberService {

	//DAO 와 연결 처리
	@Autowired  //자동 DI 처리됨 : 자동 객체 생성됨
	MemberDao memberDao;	
	
	@Override
	public Member selectLogin(Member member) {
		return memberDao.selectLogin(member);
	}

	@Override
	public ArrayList<Member> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
