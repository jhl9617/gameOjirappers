package org.team404.gameOjirap.community.community.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 신고 vo클래스
 */
public class CReport implements Serializable {

    private String user_id;
    private int communityId;
    private String c_report_time;
    private Date c_report_desc;

    public CReport() {
    }

    public CReport(String user_id, int communityId, Date c_report_desc) {
        this.user_id = user_id;
        this.communityId = communityId;
        this.c_report_desc = c_report_desc;
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

    public String getC_report_time() {
        return c_report_time;
    }

    public void setC_report_time(String c_report_time) {
        this.c_report_time = c_report_time;
    }

    public Date getC_report_desc() {
        return c_report_desc;
    }

    public void setC_report_desc(Date c_report_desc) {
        this.c_report_desc = c_report_desc;
    }

    @Override
    public String toString() {
        return "CReport{" +
                "user_id='" + user_id + '\'' +
                ", cboard_no=" + communityId +
                ", c_report_time='" + c_report_time + '\'' +
                ", c_report_res=" + c_report_desc +
                '}';
    }
}
