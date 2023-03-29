package org.team404.gameOjirap.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.board.model.vo.BoardGen;

@Repository("boardDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<BoardGen> selectList() {
		List<BoardGen> list = session.selectList("boardMapper.selectList");
		return (ArrayList<BoardGen>)list;
	}

	public BoardGen selectOne(int board_no) {
		return session.selectOne("boardMapper.selectOne", board_no);
	}

	public ArrayList<BoardGen> selectBoardByTitle(String keyword) {
		List<BoardGen> list = session.selectList("boardMapper.selectBoardByTitle", keyword);
		return (ArrayList<BoardGen>)list;
	}

	public int selectListCount() {
		return session.selectOne("boardMapper.selectListCount");
	}

	public int insertBoard(BoardGen board) {
		return session.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(BoardGen board) {
		return session.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(BoardGen board) {
		return session.delete("boardMapper.deleteBoard", board);
	}

	public ArrayList<BoardGen> selectRankTop5() {
		List<BoardGen> list = session.selectList("boardMapper.selectRankTop5");
		return (ArrayList<BoardGen>)list;
	}

	public int insertBoardLike(int board_no) {
		return session.insert("boardMapper.insertBoardLike", board_no);
	}

	public int deleteBoardLike(int board_no) {
		return session.delete("boardMapper.deleteBoardLike", board_no);
	}

}
