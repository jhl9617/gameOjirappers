package org.team404.gameOjirap.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.board.model.vo.Board;

@Repository("boardDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Board> selectList() {
		List<Board> list = session.selectList("boardMapper.selectList");
		return (ArrayList<Board>)list;
	}

	public Board selectOne(int board_no) {
		return session.selectOne("boardMapper.selectOne", board_no);
	}

	public ArrayList<Board> selectBoardByTitle(String keyword) {
		List<Board> list = session.selectList("boardMapper.selectBoardByTitle", keyword);
		return (ArrayList<Board>)list;
	}

	public int selectListCount() {
		return session.selectOne("boardMapper.selectListCount");
	}

	public int insertBoard(Board board) {
		return session.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(Board board) {
		return session.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(Board board) {
		return session.delete("boardMapper.deleteBoard", board);
	}

	public ArrayList<Board> selectRankTop5() {
		List<Board> list = session.selectList("boardMapper.selectRankTop5");
		return (ArrayList<Board>)list;
	}

	public int insertBoardLike(int board_no) {
		return session.insert("boardMapper.insertBoardLike", board_no);
	}

	public int deleteBoardLike(int board_no) {
		return session.delete("boardMapper.deleteBoardLike", board_no);
	}

}
