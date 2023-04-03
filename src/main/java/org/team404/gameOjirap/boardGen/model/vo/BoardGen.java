package org.team404.gameOjirap.boardGen.model.vo;

import java.sql.Date;

public class BoardGen implements java.io.Serializable{
	private static final long serialVersionUID = -460279728058378628L;
	
	private int board_no;	//게시글 번호
	private String board_title; //게시글 제목
	private String board_content; //게시글 내용
	private Date board_date;    //게시글 작성 날짜
	private int board_count;	//게시글 조회수
	private int board_like;		//게시글 좋아요 수
	private String board_orifile; //게시글 원본 파일
	private String board_refile;  //게시글 변환 파일
	private int appid;			  //게임 아이디	
	private String user_id;		  //사용자 아이디
	private String board_notice;  //공지글 제목
	
	public BoardGen() {
		super();
	}

	public BoardGen(int board_no, String board_title, String board_content, Date board_date, int board_count,
			int board_like, String board_orifile, String board_refile, int appid, String user_id, String board_notice) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_count = board_count;
		this.board_like = board_like;
		this.board_orifile = board_orifile;
		this.board_refile = board_refile;
		this.appid = appid;
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

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
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

	public int getAppid() {
		return appid;
	}

	public void setAppid(int appid) {
		this.appid = appid;
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
		return "Board [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_count=" + board_count + ", board_like=" + board_like
				+ ", board_orifile=" + board_orifile + ", board_refile=" + board_refile + ", appid=" + appid
				+ ", user_id=" + user_id + ", board_notice=" + board_notice + "]";
	}
	
	
}
