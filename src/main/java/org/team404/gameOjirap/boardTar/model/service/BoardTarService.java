package org.team404.gameOjirap.boardTar.model.service;

import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.BoardLikeCount;
import org.team404.gameOjirap.common.Paging;

import java.util.ArrayList;

public interface BoardTarService {


    int selectListCount(String appid);

    ArrayList<BoardTar> selectList(Paging paging);

    int insertTarBoard(BoardTar boardTar);

    int updateReadCount(int boardNo);

    BoardTar selectBoard(int board_no);

    int selectTarLike(BoardLikeCount likeCount);

    int updateTarLike(int boardNo);
}
