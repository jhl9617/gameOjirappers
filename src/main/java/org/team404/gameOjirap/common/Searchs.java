package org.team404.gameOjirap.common;

public class Searchs implements java.io.Serializable{

	private static final long serialVersionUID = 7673556431477340481L;
	private String keyword;
	private String action;
	private String appid;
	
	public Searchs() {
		super();
	}


	public Searchs(String keyword) {
		super();
		this.keyword = keyword;
	}

	public Searchs(String keyword, String action){
		super();
		this.keyword = keyword;
		this.action = action;
	}

	public Searchs(String keyword, String action, String appid){
		super();
		this.keyword = keyword;
		this.action = action;
		this.appid = appid;
	}

	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	@Override
	public String toString() {
		return "Searchs{" +
				"keyword='" + keyword + '\'' +
				", action='" + action + '\'' +
				", appid='" + appid + '\'' +
				'}';
	}
}
