package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 가입 요청 vo클래스
 */
public class CommunityReq implements Serializable {
    private String userId;
    private int communityId;
    private String requestDes;
    private Date requestDate;

    public CommunityReq() {
    }

    public CommunityReq(String userId, int communityId, String requestDes, Date requestDate) {
        this.userId = userId;
        this.communityId = communityId;
        this.requestDes = requestDes;

    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    public String getRequestDes() {
        return requestDes;
    }

    public void setRequestDes(String requestDes) {
        this.requestDes = requestDes;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    @Override
    public String toString() {
        return "CommunityReq{" +
                "userId='" + userId + '\'' +
                ", communityId=" + communityId +
                ", requestDes='" + requestDes + '\'' +
                ", requestDate=" + requestDate +
                '}';
    }
}
