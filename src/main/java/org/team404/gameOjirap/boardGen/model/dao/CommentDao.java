package org.team404.gameOjirap.boardGen.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.board.Comment;

@Repository("commentDao")
public class CommentDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Comment> selectList(int board_no) {
		List<Comment> list = session.selectList("commentMapper.selectList", board_no);
		return (ArrayList<Comment>)list;
	}

	

	public int insertComment(Comment comment) {
		return session.insert("commentMapper.insertComment", comment);
	}

	public int updateComment(Comment comment) {
		return session.update("commentMapper.comment", comment);
	}

	public int deleteComment(int comment) {
		return session.delete("commentMapper.deleteComment", comment);
	}

	public int selectCommentCount(int board_no) {
		return session.selectOne("commentMapper.selectCommentCount", board_no);
	}

	public int selectUserId(int board_no) {
		return session.selectOne("commentMapper.selectUserId", board_no);
	}

	
	
}
