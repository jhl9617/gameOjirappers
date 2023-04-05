package org.team404.gameOjirap.boardGen.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.Paging;

public interface BoardGenService {
	ArrayList<BoardGen> selectList(Paging page); //한 페이지에 보여질 게시글 조회용
	BoardGen selectOne(int board_no);	//해당 게시글 번호에 대한 게시글 상세 조회용
	ArrayList<BoardGen> selectBoardByTitle(String search); //게시글 제목으로 검색용
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	int insertBoard(BoardGen boardGen);  //게시글 등록용
	int updateBoard(BoardGen boardGen);  //게시글 수정용
	int deleteBoard(int boardGen);  //게시글 삭제용
	ArrayList<BoardGen> selectRankTop5();  //조회수 상위 5개 게시물 조회용
	int insertBoardLike(int board_no);	//좋아요 수 증가 처리용
	int deleteBoardLike(int board_no);  //좋아요 취소( -1 ) 처리용
	int updateBoardReadCount(int board_no);  //게시글 상세보기시 조회수 1증가 처리용
	
}
