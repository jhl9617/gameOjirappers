package org.team404.gameOjirap.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.user.model.dao.UserDao;
import org.team404.gameOjirap.user.model.vo.User;


@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired			//자동 DI 처리됨 : 자동 객체 생성되어 연결된다.
	UserDao userDao;

	@Override
	public ArrayList<CGroup> mybandtop5(String user_id) {
		return userDao.mybandtop5(user_id);
	}

	@Override
	public ArrayList<BoardGen> boardgentop5(String user_id) {
		return userDao.boardgentop5(user_id);
	}

	@Override
	public ArrayList<Comment> comment_borderTop5(String user_id) {
		return userDao.comment_borderTop5(user_id);
	}

	@Override		//1명 정보 조회
	public User selectUser(String user_id) {
		return userDao.selectUser(user_id);
	}

	@Override		//회원가입처리용
	public int userInsertMethod(User user) {
		return userDao.userInsertMethod(user);
	}

	@Override
	public int selectDupCheckId(String user_id) {
		return userDao.selectDupCheckId(user_id);
	}

	@Override
	public int selectDupCheckNick(String user_nickname) {
		return userDao.selectDupCheckNick(user_nickname);
	}

	@Override
	public ArrayList<User> selectUserList(Paging page) {
		return userDao.selectUserList(page);
	}

	//회원탈퇴요청처리용
	@Override
	public int userDeleteMethod(String user_id) {
		return userDao.userDeleteMethod(user_id);
	}



	@Override
	public int updateUser(User user)	{
		return userDao.updateUser(user);
	}

	@Override
	public int levelMethod(User user_level) {
		return userDao.levelMethod(user_level);
	}


	@Override
	public int checkanswer(String confirm_answer) {
		return userDao.checkanswer(confirm_answer);
	}

	@Override
	public int updateLoginok(User user) {
		return userDao.updateLoginok(user);
	}

	@Override
	public int updateBan(User user) {
		return userDao.updateBan(user);

	}

	@Override
	public int updateBanRelease(User loginUser) {
		return userDao.updateBanRelease(loginUser);

	}

	@Override
	public int insertFavorite(User user) {
		return 0;
	}

	@Override
	public int deleteFavorite(String user_id) {
		return 0;
	}

	@Override
	public User selectFavoriteCount(String user_id) {
		return null;
	}

	@Override
	public int updateDecPoint(User user) {
		return userDao.updateDecPoint(user);
		
	}

	@Override
	public int selectListCount() {
		return userDao.selectListCount();
	}


	@Override
	public ArrayList<User> selectSearchUID(String keyword) {
		return userDao.selectSearchUID(keyword);
	}


	@Override
	public ArrayList<User> selectSearchUN(String keyword) {
		return userDao.selectSearchUN(keyword);
	}

	@Override
	public int updateBanF(User user) {
		return userDao.updateBanF(user);
	}


}//class close

