package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 회원 vo클래스
 */
public class CMember implements Serializable {

    private String user_id;
    private int communityid;
    private Date member_date;
    private String member_roll;
    private char isdeleted;

    public CMember() {
    }

    public CMember(String user_id, int communityid, String member_roll) {
        this.user_id = user_id;
        this.communityid = communityid;
        this.member_roll = member_roll;

    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCommunityid() {
        return communityid;
    }

    public void setCommunityid(int communityid) {
        this.communityid = communityid;
    }

    public Date getMember_date() {
        return member_date;
    }

    public void setMember_date(Date member_date) {
        this.member_date = member_date;
    }

    public String getMember_roll() {
        return member_roll;
    }

    public void setMember_roll(String member_roll) {
        this.member_roll = member_roll;
    }

    public char getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(char isdeleted) {
        this.isdeleted = isdeleted;
    }

    @Override
    public String toString() {
        return "CMember{" +
                "user_id='" + user_id + '\'' +
                ", communityid=" + communityid +
                ", member_date=" + member_date +
                ", member_roll='" + member_roll + '\'' +
                ", isdeleted=" + isdeleted +
                '}';
    }
}
