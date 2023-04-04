package org.team404.gameOjirap.community.cboard.model.vo;

import java.sql.Date;

public class CComment implements java.io.Serializable{

    private int ccomno;
    private String ccomcontent;
    private Date ccomdate;
    private int ccomlvl;
    private String user_id;
    private int cboardno;
    private int communityid;

    public CComment() {
    }

    public int getCcomno() {
        return ccomno;
    }

    public void setCcomno(int ccomno) {
        this.ccomno = ccomno;
    }

    public String getCcomcontent() {
        return ccomcontent;
    }

    public void setCcomcontent(String ccomcontent) {
        this.ccomcontent = ccomcontent;
    }

    public Date getCcomdate() {
        return ccomdate;
    }

    public void setCcomdate(Date ccomdate) {
        this.ccomdate = ccomdate;
    }

    public int getCcomlvl() {
        return ccomlvl;
    }

    public void setCcomlvl(int ccomlvl) {
        this.ccomlvl = ccomlvl;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCboardno() {
        return cboardno;
    }

    public void setCboardno(int cboardno) {
        this.cboardno = cboardno;
    }

    public int getCommunityid() {
        return communityid;
    }

    public void setCommunityid(int communityid) {
        this.communityid = communityid;
    }

    @Override
    public String
    toString() {
        return "CComment{" +
                "ccomno=" + ccomno +
                ", ccomcontent='" + ccomcontent + '\'' +
                ", ccomdate=" + ccomdate +
                ", ccomlvl=" + ccomlvl +
                ", user_id='" + user_id + '\'' +
                ", cboardno=" + cboardno +
                ", communityid=" + communityid +
                '}';
    }
}

