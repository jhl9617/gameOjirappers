package org.team404.gameOjirap.boardGen.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.BoardLike;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.common.board.Comment;

@Repository("boardDao")
public class BoardGenDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<BoardGen> selectList(Paging page) {
		List<BoardGen> list = session.selectList("boardGenMapper.selectList", page);
		return (ArrayList<BoardGen>)list;
	}

	public BoardGen selectOne(int board_no) {
		return session.selectOne("boardGenMapper.selectOne", board_no);
	}

	public ArrayList<BoardGen> selectBoardByTitle(String search) {
		List<BoardGen> list = session.selectList("boardGenMapper.selectBoardByTitle", search);
		return (ArrayList<BoardGen>)list;
	}

	public int selectListCount() {
		return session.selectOne("boardGenMapper.selectListCount");
	}

	public int insertBoard(BoardGen boardGen) {
		return session.insert("boardGenMapper.insertBoard", boardGen);
	}

	public int updateBoard(BoardGen boardGen) {
		return session.update("boardGenMapper.updateBoard", boardGen);
	}

	public int deleteBoard(int boardGen) {
		return session.delete("boardGenMapper.deleteBoard", boardGen);
	}

	public ArrayList<BoardGen> selectRankTop5() {
		List<BoardGen> list = session.selectList("boardGenMapper.selectRankTop5");
		return (ArrayList<BoardGen>)list;
	}

	public int insertBoardLike(int board_no) {
		return session.insert("boardGenMapper.insertBoardLike", board_no);
	}

	public int deleteBoardLike(int board_no) {
		return session.delete("boardGenMapper.deleteBoardLike", board_no);
	}

	public int updateBoardReadCount(int board_no) {
		return session.update("boardGenMapper.updateBoardReadCount", board_no);
	}


	public int genReplyWrite(Comment comment) {
		return session.insert("boardGenMapper.genReplyWrite", comment);
	}

	public int selectGenLike(BoardLike blike) {
		return session.selectOne("boardGenMapper.selectGenLike", blike);
	}

	public int insertGenLike(BoardLike blike) {
		return session.insert("boardGenMapper.insertGenLike", blike);
	}

	public int updateGenLike(int boardNo) {
		return session.update("boardGenMapper.updateGenLike", boardNo);
	}

	public int deleteGenLike(BoardLike blike) {
		return session.delete("boardGenMapper.deleteGenLike", blike);
	}

	public int updateGenLikedis(int boardNo) {
		return session.update("boardGenMapper.updateGenLikedis", boardNo);
	}

	public int updateUserPoint(String user_id, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("point", point);
		return session.update("boardGenMapper.updateUserPoint", map);
	}
}