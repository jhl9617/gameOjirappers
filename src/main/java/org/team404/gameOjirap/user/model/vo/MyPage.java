package org.team404.gameOjirap.user.model.vo;

import java.sql.Date;

public class MyPage implements java.io.Serializable {
	private static final long serialVersionUID = 7019247536108878248L;
	
	private String user_level; 					//회원등급
	private String user_status;					//회원 활동상태
	private int user_point; 							//보유포인트
	private java.sql.Date user_access;		//접속기록
	private String user_original_profile;	//원본프로필이미지
	private String bname; 							//밴드 이름
	private String com_contents;				//내가 쓴 코멘트 제목
	private String board_title;					//내가 쓴 글 제목
	
	@Override
	public String toString() {
		return "MyPage [user_level=" + user_level + ", user_status=" + user_status + ", user_point=" + user_point
				+ ", user_access=" + user_access + ", user_original_profile=" + user_original_profile + ", bname="
				+ bname + ", com_contents=" + com_contents + ", board_title=" + board_title + "]";
	}

	public MyPage() {
		super();
	}

	public MyPage(String user_level, String user_status, int user_point, Date user_access, String user_original_profile,
			String bname, String com_contents, String board_title) {
		super();
		this.user_level = user_level;
		this.user_status = user_status;
		this.user_point = user_point;
		this.user_access = user_access;
		this.user_original_profile = user_original_profile;
		this.bname = bname;
		this.com_contents = com_contents;
		this.board_title = board_title;
	}

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public java.sql.Date getUser_access() {
		return user_access;
	}

	public void setUser_access(java.sql.Date user_access) {
		this.user_access = user_access;
	}

	public String getUser_original_profile() {
		return user_original_profile;
	}

	public void setUser_original_profile(String user_original_profile) {
		this.user_original_profile = user_original_profile;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getCom_contents() {
		return com_contents;
	}

	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	
}//class close




