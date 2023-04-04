package org.team404.gameOjirap.community.cboard.model.vo;


import java.sql.Date;

public class CBoard implements java.io.Serializable{
    private int cBoardNo;
    private String cBoardTitle;
    private String user_id;
    private String cBoardContent;
    private Date cBoardDate;
    private int communityid;
    private int cBoardLike;
    private String cBoardOrifile;
    private String cBoardRefile;
    private String cBoardNotice;

    public CBoard() {
    }

    public CBoard(String cBoardTitle, String userId, String cBoardContent, int communityid, int cBoardLike, String cBoardOrifile, String cBoardRefile, String cBoardNotice) {
        this.cBoardTitle = cBoardTitle;
        this.user_id = userId;
        this.cBoardContent = cBoardContent;
        this.communityid = communityid;
        this.cBoardLike = cBoardLike;
        this.cBoardOrifile = cBoardOrifile;
        this.cBoardRefile = cBoardRefile;
        this.cBoardNotice = cBoardNotice;
    }

    public int getcBoardNo() {
        return cBoardNo;
    }

    public void setcBoardNo(int cBoardNo) {
        this.cBoardNo = cBoardNo;
    }

    public String getcBoardTitle() {
        return cBoardTitle;
    }

    public void setcBoardTitle(String cBoardTitle) {
        this.cBoardTitle = cBoardTitle;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getcBoardContent() {
        return cBoardContent;
    }

    public void setcBoardContent(String cBoardContent) {
        this.cBoardContent = cBoardContent;
    }

    public Date getcBoardDate() {
        return cBoardDate;
    }

    public void setcBoardDate(Date cBoardDate) {
        this.cBoardDate = cBoardDate;
    }

    public int getCommunityid() {
        return communityid;
    }

    public void setCommunityid(int communityid) {
        this.communityid = communityid;
    }

    public int getcBoardLike() {
        return cBoardLike;
    }

    public void setcBoardLike(int cBoardLike) {
        this.cBoardLike = cBoardLike;
    }

    public String getcBoardOrifile() {
        return cBoardOrifile;
    }

    public void setcBoardOrifile(String cBoardOrifile) {
        this.cBoardOrifile = cBoardOrifile;
    }

    public String getcBoardRefile() {
        return cBoardRefile;
    }

    public void setcBoardRefile(String cBoardRefile) {
        this.cBoardRefile = cBoardRefile;
    }

    public String getcBoardNotice() {
        return cBoardNotice;
    }

    public void setcBoardNotice(String cBoardNotice) {
        this.cBoardNotice = cBoardNotice;
    }

    @Override
    public String toString() {
        return "CBoard{" +
                "cBoardNo=" + cBoardNo +
                ", cBoardTitle='" + cBoardTitle + '\'' +
                ", user_id='" + user_id + '\'' +
                ", cBoardContent='" + cBoardContent + '\'' +
                ", cBoardDate=" + cBoardDate +
                ", communityid=" + communityid +
                ", cBoardLike=" + cBoardLike +
                ", cBoardOrifile='" + cBoardOrifile + '\'' +
                ", cBoardRefile='" + cBoardRefile + '\'' +
                ", cBoardNotice='" + cBoardNotice + '\'' +
                '}';
    }
}


