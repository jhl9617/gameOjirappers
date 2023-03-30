package org.team404.gameOjirap.user.model.vo;

import java.sql.Date;

public class HotList implements java.io.Serializable {
	private static final long serialVersionUID = 7804036171728635735L;

	String user_id;   							 //즐찾한회원
	int game_id;    								 //즐찾한 게임정보번호
	java.sql.Date board_click_day;  	 //즐찾한 날짜
	
	
	public HotList() {
		super();
	}


	public HotList(String user_id, int game_id, Date board_click_day) {
		super();
		this.user_id = user_id;
		this.game_id = game_id;
		this.board_click_day = board_click_day;
	}


	@Override
	public String toString() {
		return "HotList [user_id=" + user_id + ", game_id=" + game_id + ", board_click_day=" + board_click_day + "]";
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getGame_id() {
		return game_id;
	}


	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}


	public java.sql.Date getBoard_click_day() {
		return board_click_day;
	}


	public void setBoard_click_day(java.sql.Date board_click_day) {
		this.board_click_day = board_click_day;
	}
	
	
	
}//class close









