package org.team404.gameOjirap.game.model.vo;

public class GameSearchs implements java.io.Serializable{
	
	private static final long serialVersionUID = 3257869231914673854L;
	
	private String keyword;
	private int finalprice;
	public GameSearchs() {
		super();
	}
	public GameSearchs(String keyword, int finalprice) {
		super();
		this.keyword = keyword;
		this.finalprice = finalprice;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GameSearchs [keyword=" + keyword + ", finalprice=" + finalprice + "]";
	}
	
	
	
	
}
