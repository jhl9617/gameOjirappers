package org.team404.gameOjirap.common.board;

import java.sql.Date;

public class Comment implements java.io.Serializable{
	private static final long serialVersionUID = 5859499308961360323L;

	private int com_no;	
	private String com_contents;	//댓글내용
	private Date com_date;				//댓글작성날짜
	private int com_lev;
	private int com_no2;
	private int board_no;
	private String user_id;
	
	public Comment() {
		super();
	}

	public Comment( int board_no, String user_id, String com_contents) {
		super();
		this.board_no = board_no;
		this.user_id = user_id;
		this.com_contents = com_contents;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	public String getCom_contents() {
		return com_contents;
	}

	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}

	public int getCom_lev() {
		return com_lev;
	}

	public void setCom_lev(int com_lev) {
		this.com_lev = com_lev;
	}

	public int getCom_no2() {
		return com_no2;
	}

	public void setCom_no2(int com_no2) {
		this.com_no2 = com_no2;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Comment [com_no=" + com_no + ", com_contents=" + com_contents + ", com_date=" + com_date + ", com_lev="
				+ com_lev + ", com_no2=" + com_no2 + ", board_no=" + board_no + ", user_id=" + user_id + "]";
	}

	
	
	
}
