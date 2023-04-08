package org.team404.gameOjirap.game.model.vo;

public class GameSearchs implements java.io.Serializable{
	
	private static final long serialVersionUID = 3257869231914673854L;
	
	private String type; //검색타입
	private String keyword;
	private int finalprice;
	
	
	public GameSearchs() {
		super();
	}


	public GameSearchs(String type, String keyword, int finalprice) {
		super();
		this.type = type;
		this.keyword = keyword;
		this.finalprice = finalprice;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public int getFinalprice() {
		return finalprice;
	}


	public void setFinalprice(int finalprice) {
		this.finalprice = finalprice;
	}


	@Override
	public String toString() {
		return "GameSearchs [type=" + type + ", keyword=" + keyword + ", finalprice=" + finalprice + "]";
	}
	
	
	
	
	
	
}
