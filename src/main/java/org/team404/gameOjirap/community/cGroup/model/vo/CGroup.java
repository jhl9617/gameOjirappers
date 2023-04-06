package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 vo클래스
 */
public class CGroup implements Serializable {
    private int communityid;
    private String communityname;
    private Date communitydate;
    private String user_id;
    private String communityimgori;
    private String communityimgrename;
    private String communitydesc;
    private String commuMem_count;
    private char isdeleted;


    public CGroup() {
    }

    public CGroup(int communityid, String communityname, Date communitydate, String user_id, String communityimgori, String communityimgrename, String communitydesc, String commuMem_count, char isdeleted) {
        this.communityid = communityid;
        this.communityname = communityname;
        this.communitydate = communitydate;
        this.user_id = user_id;
        this.communityimgori = communityimgori;
        this.communityimgrename = communityimgrename;
        this.communitydesc = communitydesc;
        this.commuMem_count = commuMem_count;
        this.isdeleted = isdeleted;
    }

    public int getCommunityid() {
        return communityid;
    }

    public void setCommunityid(int communityid) {
        this.communityid = communityid;
    }

    public String getCommunityname() {
        return communityname;
    }

    public void setCommunityname(String communityname) {
        this.communityname = communityname;
    }

    public Date getCommunitydate() {
        return communitydate;
    }

    public void setCommunitydate(Date communitydate) {
        this.communitydate = communitydate;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getCommunityimgori() {
        return communityimgori;
    }

    public void setCommunityimgori(String communityimgori) {
        this.communityimgori = communityimgori;
    }

    public String getCommunityimgrename() {
        return communityimgrename;
    }

    public void setCommunityimgrename(String communityimgrename) {
        this.communityimgrename = communityimgrename;
    }

    public String getCommunitydesc() {
        return communitydesc;
    }

    public void setCommunitydesc(String communitydesc) {
        this.communitydesc = communitydesc;
    }

    public String getCommuMem_count() {
        return commuMem_count;
    }

    public void setCommuMem_count(String commuMem_count) {
        this.commuMem_count = commuMem_count;
    }

    public char getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(char isdeleted) {
        this.isdeleted = isdeleted;
    }

    @Override
    public String toString() {
        return "CGroup{" +
                "communityid=" + communityid +
                ", communityname='" + communityname + '\'' +
                ", communitydate=" + communitydate +
                ", user_id='" + user_id + '\'' +
                ", communityimgori='" + communityimgori + '\'' +
                ", communityimgrename='" + communityimgrename + '\'' +
                ", communitydesc='" + communitydesc + '\'' +
                ", commuMem_count='" + commuMem_count + '\'' +
                ", isdeleted=" + isdeleted +
                '}';
    }
}

