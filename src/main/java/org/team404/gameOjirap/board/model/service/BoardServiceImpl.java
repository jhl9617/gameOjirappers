package org.team404.gameOjirap.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.board.model.dao.BoardDao;
import org.team404.gameOjirap.board.model.vo.BoardGen;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public ArrayList<BoardGen> selectList() {
		return boardDao.selectList();
	}

	@Override
	public BoardGen selectOne(int board_no) {
		return boardDao.selectOne(board_no);
	}

	@Override
	public ArrayList<BoardGen> selectBoardByTitle(String keyword) {
		return boardDao.selectBoardByTitle(keyword);
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public int insertBoard(BoardGen board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(BoardGen board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(BoardGen board) {
		return boardDao.deleteBoard(board);
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

}
