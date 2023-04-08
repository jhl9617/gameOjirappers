package org.team404.gameOjirap.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
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
	
	
	public ArrayList<User> selectUserList() {
		List<User> list = session.selectList("userMapper.selectUserList");	
		return (ArrayList<User>)list;
	}
	
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
	}
	
	
	//////////////////////////////////////////////////////////////////////////
	//즐찾등록요청처리용
	public int insertFavorite(User user) {
		return session.insert("userMapper.insertFavorite", user);
	}
	
	//즐찾삭제요청처리용
	public int deleteFavorite(String user_id) {
		return session.delete("userMapper.deleteFavorite", user_id);
	}
	
	//즐찾 갯수조회 => 게임과 아이디매칭
	public User selectFavoriteCount(String user_id) {
		return session.selectOne("userMapper.selectFavoriteCount", user_id);
	}
	//////////////////////////////////////////////////////////////////////////
	


	
	
	
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

	public ArrayList<CGroup> mybandtop5() {
		List<CGroup> list = session.selectList("userMapper.mybandtop5");
		return (ArrayList<CGroup>)list;
	}



}//class close











