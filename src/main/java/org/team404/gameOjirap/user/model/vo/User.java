package org.team404.gameOjirap.user.model.vo;

import java.sql.Date;

public class User implements java.io.Serializable{
	private static final long serialVersionUID = 8052901044102267158L;

	private String user_id;     			//회원아이디
	private String admin_id;   			//관리자아이디
	private String user_pwd;   			//회원비밀번호
	private String user_nickname;   	//회원닉네임
	private String user_name;    			//회원이름
	private String user_phone; 			//회원전화번호
	private String user_email;    			//회원이메일
	private String user_birth;     		//회원생일
	private String confirm_answer;   //본인확인용 질문
	private String user_level; 					//회원등급
	private String user_status;					//회원 활동상태
	private int user_point; 							//보유포인트
	private java.sql.Date user_access;		//접속기록
	private String user_original_profile;	//원본프로필이미지
	
	public User() {
		super();
	}

	public User(String user_id, String admin_id, String user_pwd, String user_nickname, String user_name,
			String user_phone, String user_email, String user_birth, String confirm_answer, String user_level,
			String user_status, int user_point, Date user_access, String user_original_profile) {
		super();
		this.user_id = user_id;
		this.admin_id = admin_id;
		this.user_pwd = user_pwd;
		this.user_nickname = user_nickname;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.confirm_answer = confirm_answer;
		this.user_level = user_level;
		this.user_status = user_status;
		this.user_point = user_point;
		this.user_access = user_access;
		this.user_original_profile = user_original_profile;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", admin_id=" + admin_id + ", user_pwd=" + user_pwd + ", user_nickname="
				+ user_nickname + ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_email="
				+ user_email + ", user_birth=" + user_birth + ", confirm_answer=" + confirm_answer + ", user_level="
				+ user_level + ", user_status=" + user_status + ", user_point=" + user_point + ", user_access="
				+ user_access + ", user_original_profile=" + user_original_profile + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getConfirm_answer() {
		return confirm_answer;
	}

	public void setConfirm_answer(String confirm_answer) {
		this.confirm_answer = confirm_answer;
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









