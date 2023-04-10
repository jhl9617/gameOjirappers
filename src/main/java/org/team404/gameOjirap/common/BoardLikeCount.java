package org.team404.gameOjirap.common;

import org.springframework.stereotype.Component;

@Component
public class BoardLikeCount {

    private String user_id;
    private int board_no;

    public BoardLikeCount() {
    }

    public BoardLikeCount(String user_id, int board_no) {
        this.user_id = user_id;
        this.board_no = board_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getBoard_no() {
        return board_no;
    }

    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }

    @Override
    public String toString() {
        return "BoardLikeCount{" +
                "user_id='" + user_id + '\'' +
                ", board_no=" + board_no +
                '}';
    }
}
