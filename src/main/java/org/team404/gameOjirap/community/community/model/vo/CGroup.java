package org.team404.gameOjirap.community.community.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 vo클래스
 */
public class CGroup implements Serializable {
    private int communityId;
    private String communityName;
    private Date communityDate;
    private String userId;
    private String communityImgOri;
    private String communityImgRename;



    public CGroup() {
    }

    public CGroup(String communityName, String userId) {
        this.communityName = communityName;
        this.userId = userId;

    }

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    public Date getCommunityDate() {
        return communityDate;
    }

    public void setCommunityDate(Date communityDate) {
        this.communityDate = communityDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommunityImgOri() {
        return communityImgOri;
    }

    public void setCommunityImgOri(String communityImgOri) {
        this.communityImgOri = communityImgOri;
    }

    public String getCommunityImgRename() {
        return communityImgRename;
    }

    public void setCommunityImgRename(String communityImgRename) {
        this.communityImgRename = communityImgRename;
    }

    @Override
    public String toString() {
        return "community{" +
                "communityId=" + communityId +
                ", communityName='" + communityName + '\'' +
                ", communityDate=" + communityDate +
                ", userId='" + userId + '\'' +
                ", communityImgId='" + communityImgOri + '\'' +
                '}';
    }
}
