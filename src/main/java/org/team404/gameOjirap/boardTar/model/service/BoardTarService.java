package org.team404.gameOjirap.boardTar.model.service;

import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.Searchs;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.common.BoardLike;

import java.util.ArrayList;
import java.util.Map;

public interface BoardTarService {

    int selectListCount(String appid);

    ArrayList<BoardTar> selectList(Paging paging);

    int insertTarBoard(BoardTar boardTar);

    int updateReadCount(int boardNo);

    BoardTar selectBoard(int board_no);

    int selectTarLike(BoardLike likeCount);

    int updateTarLike(int boardNo);

    int deleteBoard(int boardNo);

    int updateBoard(BoardTar boardTar);

    int insertTarLike(BoardLike blike);

    int deleteTarLike(BoardLike blike);

    int updateTarLikedis(int boardNo);

    int insertTarReply(Comment comment);

    ArrayList<Comment> selectComments(int boardNo);

    int updateTarReply(Comment comment);

    int selectSearchListCount(Searchs searchs);

    ArrayList<BoardTar> selectSearchList(Map map);

    int deleteTarReply(int comNo);
}
