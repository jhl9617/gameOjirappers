package org.team404.gameOjirap.user.model.service;


import java.util.ArrayList;

import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.user.model.vo.User;
 

public interface UserService {

	//mybandtop5 출력 처리용
	ArrayList<CGroup> mybandtop5();

	User selectUser(String user_id);									// 회원 1명 조회
	ArrayList<User> selectUserList();								//회원 리스트 조회
	int userInsertMethod(User user);    								// 회원가입 요청처리용
	int selectDupCheckId(String user_id); 							// 아이디 중복확인용
	int selectDupCheckNick(String user_nickname);			// 닉네임 중복확인용
	int userDeleteMethod(String user_id);  						// 회원탈퇴 요청처리용
	
	int updateUser(User user);
	int levelMethod(User user_level);     							// 현재등급 출력용
	int checkanswer(String confirm_answer);						//본인확인 질문 확인용
	int updateLoginok (User user);										//로그인가능 확인용
	void updateBan(User user);									// 유저 정지용
	void updateBanRelease(User loginUser);					// 유저 정지 해제용

	
	int insertFavorite(User user);										//즐찾등록요청처리용
	int deleteFavorite(String user_id);								//즐찾삭제요청처리용
	User selectFavoriteCount(String user_id);					//즐찾 갯수조회 => 게임과 아이디매칭

}