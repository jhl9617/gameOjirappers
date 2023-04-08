package org.team404.gameOjirap.community.cGroup.model.vo;

import java.io.Serializable;
import java.sql.Date;


/**
 * 커뮤니티 신고 vo클래스
 */
public class CReport implements Serializable {

    private String user_id;
    private int communityid;
    private Date c_report_time;
    private String c_report_desc;
    private String c_rep_type;

    public CReport() {
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

    public Date getC_report_time() {
        return c_report_time;
    }

    public void setC_report_time(Date c_report_time) {
        this.c_report_time = c_report_time;
    }

    public String getC_report_desc() {
        return c_report_desc;
    }

    public void setC_report_desc(String c_report_desc) {
        this.c_report_desc = c_report_desc;
    }

    public String getC_rep_type() {
        return c_rep_type;
    }

    public void setC_rep_type(String c_rep_type) {
        this.c_rep_type = c_rep_type;
    }

    @Override
    public String toString() {
        return "CReport{" +
                "user_id='" + user_id + '\'' +
                ", communityid=" + communityid +
                ", c_report_time=" + c_report_time +
                ", c_report_desc='" + c_report_desc + '\'' +
                ", c_rep_type='" + c_rep_type + '\'' +
                '}';
    }

    public CReport(String user_id, int communityid, Date c_report_time, String c_report_desc, String c_rep_type) {
        this.user_id = user_id;
        this.communityid = communityid;
        this.c_report_time = c_report_time;
        this.c_report_desc = c_report_desc;
        this.c_rep_type = c_rep_type;
    }
}
