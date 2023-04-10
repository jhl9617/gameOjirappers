package org.team404.gameOjirap.boardTar.model.vo;

import java.sql.Date;

public class BoardTar implements java.io.Serializable{


	private static final long serialVersionUID = -5701946729213390024L;
	private int board_no;
	private String board_title;
	private String board_content;
	private Date date;
	private int board_count;
	private String appid;
	private int board_like;
	private String board_orifile;
	private String board_refile;
	private String user_id;
	private String board_notice;
	
	public BoardTar() {
		super();
	}

	public BoardTar(int board_no, String board_title, String board_content, Date date, int board_count, String appid,
					int board_like, String board_orifile, String board_refile, String user_id, String board_notice) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.date = date;
		this.board_count = board_count;
		this.appid = appid;
		this.board_like = board_like;
		this.board_orifile = board_orifile;
		this.board_refile = board_refile;
		this.user_id = user_id;
		this.board_notice = board_notice;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public String getBoard_orifile() {
		return board_orifile;
	}

	public void setBoard_orifile(String board_orifile) {
		this.board_orifile = board_orifile;
	}

	public String getBoard_refile() {
		return board_refile;
	}

	public void setBoard_refile(String board_refile) {
		this.board_refile = board_refile;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_notice() {
		return board_notice;
	}

	public void setBoard_notice(String board_notice) {
		this.board_notice = board_notice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BoardQna [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", date=" + date + ", board_count=" + board_count + ", appid=" + appid + ", board_like=" + board_like
				+ ", board_orifile=" + board_orifile + ", board_refile=" + board_refile + ", user_id=" + user_id
				+ ", board_notice=" + board_notice + "]";
	}
	
	
}
