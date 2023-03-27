package org.team404.gameOjirap.board.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.board.model.vo.Board;

public interface BoardService {
	ArrayList<Board> selectList();	//게시글 전체 리스트 보기용
	Board selectOne(int board_no);	//해당 게시글 번호에 대한 조회수 1증가 처리용
	ArrayList<Board> selectBoardByTitle(String keyword); //게시글 제목으로 검색용
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	int insertBoard(Board board);  //게시글 등록용
	int updateBoard(Board board);  //게시글 수정용
	int deleteBoard(Board board);  //게시글 삭제용
	ArrayList<Board> selectRankTop5();  //조회수 상위 5개 게시물 조회용
	int insertBoardLike(int board_no);	//좋아요 수 증가 처리용
	int deleteBoardLike(int board_no);  //좋아요 취소( -1 ) 처리용
	
}
