package org.team404.gameOjirap.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.team404.gameOjirap.board.model.dao.BoardDao;
import org.team404.gameOjirap.board.model.vo.Board;

public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public ArrayList<Board> selectList() {
		return boardDao.selectList();
	}

	@Override
	public Board selectOne(int board_no) {
		return boardDao.selectOne(board_no);
	}

	@Override
	public ArrayList<Board> selectBoardByTitle(String keyword) {
		return boardDao.selectBoardByTitle(keyword);
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(Board board) {
		return boardDao.deleteBoard(board);
	}

	@Override
	public ArrayList<Board> selectRankTop5() {
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

}
