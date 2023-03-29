package org.team404.gameOjirap.community.cSchedule.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CSchedule implements Serializable {

    private int schId;
    private String schName;
    private String schDes;
    private int communityId;
    private Date schStart;
    private Date schEnd;

    public CSchedule() {
    }

    public int getSchId() {
        return schId;
    }

    public void setSchId(int schId) {
        this.schId = schId;
    }

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }

    public String getSchDes() {
        return schDes;
    }

    public void setSchDes(String schDes) {
        this.schDes = schDes;
    }

    public Date getSchStart() {
        return schStart;
    }

    public void setSchStart(Date schStart) {
        this.schStart = schStart;
    }

    public Date getSchEnd() {
        return schEnd;
    }

    public void setSchEnd(Date schEnd) {
        this.schEnd = schEnd;
    }

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    @Override
    public String toString() {
        return "CSchedule{" +
                "schId=" + schId +
                ", schName='" + schName + '\'' +
                ", schDes='" + schDes + '\'' +
                ", communityId=" + communityId +
                ", schStart=" + schStart +
                ", schEnd=" + schEnd +
                '}';
    }

}
