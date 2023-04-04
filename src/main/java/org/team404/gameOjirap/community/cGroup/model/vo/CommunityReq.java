package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 가입 요청 vo클래스
 */
public class CommunityReq implements Serializable {

    private static final long serialVersionUID = 6075143950164219433L;
    private String user_id;
    private int communityid;
    private String requestdes;
    private Date requestdate;

    public CommunityReq() {
    }

    public CommunityReq(String user_id, int communityid, String requestdes, Date requestdate) {
        this.user_id = user_id;
        this.communityid = communityid;
        this.requestdes = requestdes;
        this.requestdate = requestdate;
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

    public String getRequestdes() {
        return requestdes;
    }

    public void setRequestdes(String requestdes) {
        this.requestdes = requestdes;
    }

    public Date getRequestdate() {
        return requestdate;
    }

    public void setRequestdate(Date requestdate) {
        this.requestdate = requestdate;
    }

    @Override
    public String toString() {
        return "CommunityReq{" +
                "user_id='" + user_id + '\'' +
                ", communityid=" + communityid +
                ", requestdes='" + requestdes + '\'' +
                ", requestdate=" + requestdate +
                '}';
    }
}
