package org.team404.gameOjirap.user.model.vo;

import java.sql.Date;

public class MyPage implements java.io.Serializable {
	private static final long serialVersionUID = 7019247536108878248L;
	
	private String user_level; 					//회원등급
	private String user_status;					//회원 활동상태
	private int user_point; 							//보유포인트
	private java.sql.Date user_access;		//접속기록
	private String user_original_profile;	//원본프로필이미지
	
	public MyPage() {
		super();
	}

	public MyPage(String user_level, String user_status, int user_point, Date user_access,
			String user_original_profile) {
		super();
		this.user_level = user_level;
		this.user_status = user_status;
		this.user_point = user_point;
		this.user_access = user_access;
		this.user_original_profile = user_original_profile;
	}

	@Override
	public String toString() {
		return "MyPage [user_level=" + user_level + ", user_status=" + user_status + ", user_point=" + user_point
				+ ", user_access=" + user_access + ", user_original_profile=" + user_original_profile + "]";
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
	
	
	
}//class close




