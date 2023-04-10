package org.team404.gameOjirap.boardGen.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.boardGen.model.dao.CommentDao;
import org.team404.gameOjirap.common.board.Comment;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public ArrayList<Comment> selectList(int board_no) {
		return commentDao.selectList(board_no);
	}

	

	@Override
	public int insertComment(Comment comment) {
		return commentDao.insertComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return commentDao.updateComment(comment);
	}

	@Override
	public int deleteComment(int comment) {
		return commentDao.deleteComment(comment);
	}



	@Override
	public int selectCommentCount(int board_no) {
		return commentDao.selectCommentCount(board_no);
	}



	@Override
	public int selectUserId(int board_no) {
		return commentDao.selectUserId(board_no);
	}

}
