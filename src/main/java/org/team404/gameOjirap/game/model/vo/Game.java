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
    private String headerimg;
    private String movie;
    private String releasedate;
    private String achievement;
    private int positive;
    private int ccu;
    private String short_description;
    private String supported_languages;
    private String pcminimum;
    private String pcrecommended;
    
    

    public Game() {
    }

    

    public Game(String appid, String name, String developer, String publisher, String initialprice, String finalprice,
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

    public String getheaderimgs() {
        return headerimg;
    }

    public void setheaderimgs(String headerimg) {
        this.headerimg = headerimg;
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
