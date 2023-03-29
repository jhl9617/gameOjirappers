package org.team404.gameOjirap.game.model.vo;

import java.io.Serializable;

public class Game implements Serializable {
    private static final long serialVersionUID = 6963064484999333664L;
    private String appid;
    private String name;
    private String developer;
    private String publisher;
    private String initialprice;
    private String finalprice;
    private int discountrate;
    private String description;
    private String platform;
    private int meta;
    private String category;
    private String genre;
    private String screenshot;
    private String movie;
    private String releasedate;
    private String achievement;
    private int positive;
    private int ccu;

    public Game() {
    }

    public Game(String appid, String name, String developer, String publisher, String initialprice, String finalprice, int discountrate, String description, String platform, int meta, String category, String genre, String screenshot, String movie, String releasedate, String achievement, int positive, int ccu) {
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
        this.screenshot = screenshot;
        this.movie = movie;
        this.releasedate = releasedate;
        this.achievement = achievement;
        this.positive = positive;
        this.ccu = ccu;
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

    public String getInitialprice() {
        return initialprice;
    }

    public void setInitialprice(String initialPrice) {
        this.initialprice = initialPrice;
    }

    public String getFinalprice() {
        return finalprice;
    }

    public void setFinalprice(String finalPrice) {
        this.finalprice = finalPrice;
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

    public String getScreenshots() {
        return screenshot;
    }

    public void setScreenshots(String screenshot) {
        this.screenshot = screenshot;
    }

    public String getMovies() {
        return movie;
    }

    public void setMovies(String movie) {
        this.movie = movie;
    }

    public String getreleasedate() {
        return releasedate;
    }

    public void setreleasedate(String releasedate) {
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

	@Override
	public String toString() {
		return "Game [appid=" + appid + ", name=" + name + ", developer=" + developer + ", publisher=" + publisher
				+ ", initialprice=" + initialprice + ", finalprice=" + finalprice + ", discountrate=" + discountrate
				+ ", description=" + description + ", platform=" + platform + ", meta=" + meta + ", category="
				+ category + ", genre=" + genre + ", screenshot=" + screenshot + ", movie=" + movie + ", releasedate="
				+ releasedate + ", achievement=" + achievement + ", positive=" + positive + ", ccu=" + ccu + "]";
	}

    
}
