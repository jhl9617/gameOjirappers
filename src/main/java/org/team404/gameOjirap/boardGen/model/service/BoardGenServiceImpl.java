package org.team404.gameOjirap.boardGen.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.boardGen.model.dao.BoardGenDao;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.BoardLike;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.common.board.Comment;

@Service("boardGenService")
public class BoardGenServiceImpl implements BoardGenService {

	@Autowired
	private BoardGenDao boardDao;
	
	@Override
	public ArrayList<BoardGen> selectList(Paging page) {
		return boardDao.selectList(page);
	}

	@Override
	public BoardGen selectOne(int board_no) {
		return boardDao.selectOne(board_no);
	}

	@Override
	public ArrayList<BoardGen> selectBoardByTitle(String search) {
		return boardDao.selectBoardByTitle(search);
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public int insertBoard(BoardGen boardGen) {
		return boardDao.insertBoard(boardGen);
	}

	@Override
	public int updateBoard(BoardGen boardGen) {
		return boardDao.updateBoard(boardGen);
	}

	@Override
	public int deleteBoard(int boardGen) {
		return boardDao.deleteBoard(boardGen);
	}

	@Override
	public ArrayList<BoardGen> selectRankTop5() {
		return boardDao.selectRankTop5();
	}

	@Override
	public int insertBoardLike(int board_no) {
		return boardDao.insertBoardLike(board_no);
	}

	@Override
	public int deleteBoardLike(int board_no) {
		return boardDao.deleteBoardLike(board_no);
	}

	@Override
	public int updateBoardReadCount(int board_no) {
		return boardDao.updateBoardReadCount(board_no);
	}

	@Override
	public int genReplyWrite(Comment comment) {
		return boardDao.genReplyWrite(comment);
	}

	@Override
	public int selectGenLike(BoardLike blike) {
		return boardDao.selectGenLike(blike);
	}

	@Override
	public int insertGenLike(BoardLike blike) {
		return boardDao.insertGenLike(blike);
	}

	@Override
	public int updateGenLike(int boardNo) {
		return boardDao.updateGenLike(boardNo);
	}

	@Override
	public int deleteGenLike(BoardLike blike) {
		return boardDao.deleteGenLike(blike);
	}

	@Override
	public int updateGenLikedis(int boardNo) {
		return boardDao.updateGenLikedis(boardNo);
	}

	@Override
	public int updateUserPoint(String user_id, int point) {
		return boardDao.updateUserPoint(user_id, point);
	}

}
