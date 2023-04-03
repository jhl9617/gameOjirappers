package org.team404.gameOjirap.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.board.model.vo.BoardGen;
import org.team404.gameOjirap.common.Paging;

@Repository("boardDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<BoardGen> selectList(Paging page) {
		List<BoardGen> list = session.selectList("boardMapper.selectList");
		return (ArrayList<BoardGen>)list;
	}

	public BoardGen selectOne(int board_no) {
		return session.selectOne("boardMapper.selectOne", board_no);
	}

	public ArrayList<BoardGen> selectBoardByTitle(String search) {
		List<BoardGen> list = session.selectList("boardMapper.selectBoardByTitle", search);
		return (ArrayList<BoardGen>)list;
	}

	public int selectListCount() {
		return session.selectOne("boardMapper.selectListCount");
	}

	public int insertBoard(BoardGen boardGen) {
		return session.insert("boardMapper.insertBoard", boardGen);
	}

	public int updateBoard(BoardGen boardGen) {
		return session.update("boardMapper.updateBoard", boardGen);
	}

	public int deleteBoard(int boardGen) {
		return session.delete("boardMapper.deleteBoard", boardGen);
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

	public int updateBoardReadCount(int board_no) {
		return session.update("boardMapper.updateBoardReadCount", board_no);
	}

}
