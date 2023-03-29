package org.team404.gameOjirap.community.cSchedule.model.vo;

import java.sql.Date;

public class CVote {
    private int schId;
    private String votePart;
    private Date voteDate;
    private String user_id;

    public CVote() {
    }

    public int getSchId() {
        return schId;
    }

    public void setSchId(int schId) {
        this.schId = schId;
    }

    public String getVotePart() {
        return votePart;
    }

    public void setVotePart(String votePart) {
        this.votePart = votePart;
    }

    public Date getVoteDate() {
        return voteDate;
    }

    public void setVoteDate(Date voteDate) {
        this.voteDate = voteDate;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "CVote{" +
                "schId=" + schId +
                ", votePart='" + votePart + '\'' +
                ", voteDate=" + voteDate +
                ", user_id='" + user_id + '\'' +
                '}';
    }
}
