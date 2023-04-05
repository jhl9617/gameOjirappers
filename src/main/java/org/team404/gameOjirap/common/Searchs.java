package org.team404.gameOjirap.common;

public class Searchs implements java.io.Serializable{

	private static final long serialVersionUID = 7673556431477340481L;
	private String keyword;

	
	public Searchs() {
		super();
	}


	public Searchs(String keyword) {
		super();
		this.keyword = keyword;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	@Override
	public String toString() {
		return "Searchs [keyword=" + keyword + "]";
	}

	
}
