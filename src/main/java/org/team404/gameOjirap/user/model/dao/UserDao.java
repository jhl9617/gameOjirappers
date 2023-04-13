package org.team404.gameOjirap.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;
import org.team404.gameOjirap.user.model.vo.User;

@Repository("UserDao")
public class UserDao {
	//★★★★★★ServiceImpl로부터 받은 값을 처리해서 Controller로 넘기는 파트임!

	@Autowired	
	private SqlSessionTemplate session;	

	//1명 정보 조회
	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectUser", user_id);	
	}

	//아이디중복확인용
	public int selectDupCheckId(String user_id) {
		return session.selectOne("userMapper.selectDupCheckId", user_id);	
	}
	
	//닉네임중복확인용
	public int selectDupCheckNick(String user_nickname) {
		return session.selectOne("userMapper.selectDupCheckNick", user_nickname);	
	}
	
	//회원가입요청처리용
	public int userInsertMethod(User user) {
		return session.insert("userMapper.userInsertMethod", user);
	}
	
	//회원탈퇴요청처리용
	public int userDeleteMethod(String user_id) {
		return session.delete("userMapper.userDeleteMethod", user_id);
	}
	
	
	public ArrayList<User> selectUserList(Paging page) {
		List<User> list = session.selectList("userMapper.selectUserList", page);	
		return (ArrayList<User>)list;
	}
	
	//정보수정용
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
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
	
	// 유저 활동정지 처리용-------------------------------------------------
	public int updateBan(User user) {
		return session.update("userMapper.updateBan", user);
	}

	// 유저 활동정지 해제처리용------------------------------------
	public int updateBanRelease(User loginUser) {
		return session.update("userMapper.updateBanRelease", loginUser);
		
	}

	

	public ArrayList<CGroup> mybandtop5(String user_id) {
		List<CGroup> list = session.selectList("userMapper.mybandtop5", user_id);
		return (ArrayList<CGroup>)list;
	}
	
	public ArrayList<BoardGen> boardgentop5(String user_id) {
		List<BoardGen> list = session.selectList("userMapper.boardgentop5", user_id);
		return (ArrayList<BoardGen>)list;
	}
 
	public ArrayList<Comment> comment_borderTop5(String user_id) {
		List<Comment> list = session.selectList("userMapper.comment_borderTop5", user_id);
		return (ArrayList<Comment>)list;
	}


	public int updateDecPoint(User user) {
		return session.update("userMapper.updateDecPoint", user);
		
	}

	public int selectListCount() {
		return session.selectList("userMapper.selectUserListCount").size();
		
	}

	public ArrayList<User> selectSearchUID(String keyword) {
		List<User> list = session.selectList("userMapper.selectSearchUID", keyword);
		return (ArrayList<User>)list;
	}

	public ArrayList<User> selectSearchUN(String keyword) {
		List<User> list = session.selectList("userMapper.selectSearchUN", keyword);
		return (ArrayList<User>)list;
	}

	public int updateBanF(User user) {
		return session.update("userMapper.updateBanF", user);
	}



}//class close











