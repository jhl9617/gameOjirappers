package org.team404.gameOjirap.member.model.service;

import org.team404.gameOjirap.member.model.vo.Member;

import java.util.ArrayList;

//스프링에서는 모델의 서비스 클래스는 인터페이스로 만들도록 정해져 있음
public interface MemberService {
	Member selectLogin(Member member);
	ArrayList<Member> selectList();
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);	
}
