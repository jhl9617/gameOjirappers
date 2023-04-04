package org.team404.gameOjirap.game.model.vo;

import java.io.Serializable;

public class Game implements Serializable {
    private static final long serialVersionUID = 6963064484999333664L;

    private String appid;					//게임 ID
    private String name;					//게임 이름
    private String developer;				//게임 개발자
    private String publisher;				//게임 배급사
    private int initialprice;			//게임 초기가격
    private int finalprice;				//게임 최종가격
    private int discountrate;				//할인율
    private String description;				//게임 설명
    private String platform;				//게임 플랫폼
    private int meta;						//메타크리틱 게임 평점
    private String category;				//카테고리 ID
    private String genre;					//게임 장르
    private String headerimg;				//게임 이미지
    private String movie;					//게임 동영상
    private String releasedate;				//게임 출시일
    private String achievement;				//게임 도전과제
    private int positive;					//게임 긍정평점
    private int ccu;						//전날 최고 동시 접속사
    private String short_description;		//게임설명 축약
    private String supported_languages;		//지원하는 언어
    private String pcminimum;				//게임컴퓨터 환경 최소 사양
    private String pcrecommended;			//적정사양
    


    public Game() {
    }



	public Game(String appid, String name, String developer, String publisher, int initialprice, int finalprice,
			int discountrate, String description, String platform, int meta, String category, String genre,
			String headerimg, String movie, String releasedate, String achievement, int positive, int ccu,
			String short_description, String supported_languages, String pcminimum, String pcrecommended) {
		super();
		this.appid = appid;
		this.name = name;
		this.developer = developer;
		this.publisher = publisher;
		this.initialprice = initialprice;
		this.finalprice = finalprice;
		this.discountrate = discountrate;
		this.description = description;
		this.platform = platform;
		this.meta = meta;
		this.category = category;
		this.genre = genre;
		this.headerimg = headerimg;
		this.movie = movie;
		this.releasedate = releasedate;
		this.achievement = achievement;
		this.positive = positive;
		this.ccu = ccu;
		this.short_description = short_description;
		this.supported_languages = supported_languages;
		this.pcminimum = pcminimum;
		this.pcrecommended = pcrecommended;
	}



	public String getAppid() {
		return appid;
	}



	public void setAppid(String appid) {
		this.appid = appid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDeveloper() {
		return developer;
	}



	public void setDeveloper(String developer) {
		this.developer = developer;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public int getInitialprice() {
		return initialprice;
	}



	public void setInitialprice(int initialprice) {
		this.initialprice = initialprice;
	}



	public int getFinalprice() {
		return finalprice;
	}



	public void setFinalprice(int finalprice) {
		this.finalprice = finalprice;
	}



	public int getDiscountrate() {
		return discountrate;
	}



	public void setDiscountrate(int discountrate) {
		this.discountrate = discountrate;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getPlatform() {
		return platform;
	}



	public void setPlatform(String platform) {
		this.platform = platform;
	}



	public int getMeta() {
		return meta;
	}



	public void setMeta(int meta) {
		this.meta = meta;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getGenre() {
		return genre;
	}



	public void setGenre(String genre) {
		this.genre = genre;
	}



	public String getHeaderimg() {
		return headerimg;
	}



	public void setHeaderimg(String headerimg) {
		this.headerimg = headerimg;
	}



	public String getMovie() {
		return movie;
	}



	public void setMovie(String movie) {
		this.movie = movie;
	}



	public String getReleasedate() {
		return releasedate;
	}



	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}



	public String getAchievement() {
		return achievement;
	}



	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}



	public int getPositive() {
		return positive;
	}



	public void setPositive(int positive) {
		this.positive = positive;
	}



	public int getCcu() {
		return ccu;
	}



	public void setCcu(int ccu) {
		this.ccu = ccu;
	}



	public String getShort_description() {
		return short_description;
	}



	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}



	public String getSupported_languages() {
		return supported_languages;
	}



	public void setSupported_languages(String supported_languages) {
		this.supported_languages = supported_languages;
	}



	public String getPcminimum() {
		return pcminimum;
	}



	public void setPcminimum(String pcminimum) {
		this.pcminimum = pcminimum;
	}



	public String getPcrecommended() {
		return pcrecommended;
	}



	public void setPcrecommended(String pcrecommended) {
		this.pcrecommended = pcrecommended;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Game [appid=" + appid + ", name=" + name + ", developer=" + developer + ", publisher=" + publisher
				+ ", initialprice=" + initialprice + ", finalprice=" + finalprice + ", discountrate=" + discountrate
				+ ", description=" + description + ", platform=" + platform + ", meta=" + meta + ", category="
				+ category + ", genre=" + genre + ", headerimg=" + headerimg + ", movie=" + movie + ", releasedate="
				+ releasedate + ", achievement=" + achievement + ", positive=" + positive + ", ccu=" + ccu
				+ ", short_description=" + short_description + ", supported_languages=" + supported_languages
				+ ", pcminimum=" + pcminimum + ", pcrecommended=" + pcrecommended + "]";
	}

    

    

    
}
