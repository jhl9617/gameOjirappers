package org.team404.gameOjirap.user.model.service;


import java.util.ArrayList;


import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;
import org.team404.gameOjirap.user.model.vo.User;
 

public interface UserService {

	
	ArrayList<CGroup> mybandtop5(String user_id);			//mybandtop5 출력 처리용
	ArrayList<BoardGen> boardgentop5(String user_id);	//자유게시글top5 출력 처리용
	ArrayList<Comment> comment_borderTop5(String user_id);			//게시글 댓글 top5 출력 처리용

	User selectUser(String user_id);									// 회원 1명 조회
	ArrayList<User> selectUserList(Paging page);								//회원 리스트 조회
	int userInsertMethod(User user);    								// 회원가입 요청처리용
	int selectDupCheckId(String user_id); 							// 아이디 중복확인용
	int selectDupCheckNick(String user_nickname);			// 닉네임 중복확인용
	int userDeleteMethod(String user_id);  						// 회원탈퇴 요청처리용
	
	int updateUser(User user);											//회원 정보수정처리용
	int levelMethod(User user_level);     							// 현재등급 출력용
	int checkanswer(String confirm_answer);						//본인확인 질문 확인용
	int updateLoginok (User user);										//로그인가능 확인용
	int updateBan(User user);									// 유저 정지용
	int updateBanRelease(User loginUser);					// 유저 정지 해제용
	int updateDecPoint(User user);								// 유저 포인트 차감용

	
	int insertFavorite(User user);										//즐찾등록요청처리용
	int deleteFavorite(String user_id);								//즐찾삭제요청처리용
	User selectFavoriteCount(String user_id);					//즐찾 갯수조회 => 게임과 아이디매칭


	int selectListCount();

	ArrayList<User> selectSearchUID(String keyword);
	ArrayList<User> selectSearchUN(String keyword);

}