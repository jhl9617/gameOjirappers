package org.team404.gameOjirap.boardGen.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.common.board.Comment;

public interface CommentService {

	int selectCommentCount(int board_no); //댓글 갯수
	int selectUserId(int board_no);
	int insertComment(Comment comment); //댓글 등록용
	int updateComment(Comment comment); //댓글 수정용
	int deleteComment(int comment); //댓글 삭제용

	ArrayList<Comment> selectCommentList(int boardNo); //댓글 전체 조회
}
