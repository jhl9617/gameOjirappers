package org.team404.gameOjirap.user.model.service;


import org.apache.catalina.User;

public interface InOutService {

	User loginMethod(User user);     									 // 로그인 요청처리용	//객체정보 1개 받아서 리턴시킴
	int userDeleteMethod(String user_id);  						// 회원탈퇴 요청처리용
	int userInsertMethod(User user);    								// 회원가입 요청처리용
	int levelMethod(User user);     										// 현재등급 출력용
	int checkanswer(User user);      									// 본인확인용
	int selectDupCheckId(String user_id); 							// 아이디 중복확인용
	int selectDupCheckNick(String user_nickname);			// 닉네임 중복확인용
	int checkanswer(String confirm_answer);						//본인확인 질문 확인용
	int updateLoginok (User user);										//로그인가능 확인용
	}
	
