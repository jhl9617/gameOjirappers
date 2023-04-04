package org.team404.gameOjirap.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.board.model.dao.BoardDao;
import org.team404.gameOjirap.board.model.vo.BoardGen;
import org.team404.gameOjirap.common.Paging;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
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

}
