package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 회원 vo클래스
 */
public class CMember implements Serializable {

    private String user_id;
    private int communityId;
    private String member_roll;
    private Date member_date;

    public CMember() {
    }

    public CMember(String user_id, int communityId, String member_roll) {
        this.user_id = user_id;
        this.communityId = communityId;
        this.member_roll = member_roll;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    public String getMember_roll() {
        return member_roll;
    }

    public void setMember_roll(String member_roll) {
        this.member_roll = member_roll;
    }

    public Date getMember_date() {
        return member_date;
    }

    public void setMember_date(Date member_date) {
        this.member_date = member_date;
    }

    @Override
    public String toString() {
        return "CMember{" +
                "user_id='" + user_id + '\'' +
                ", communityId=" + communityId +
                ", member_roll='" + member_roll + '\'' +
                ", member_date=" + member_date +
                '}';
    }
}
