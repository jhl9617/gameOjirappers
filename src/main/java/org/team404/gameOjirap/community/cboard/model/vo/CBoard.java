package org.team404.gameOjirap.community.cboard.model.vo;

import java.sql.Date;

public class CBoard {
    private int cBoardNo;
    private String cBoardTitle;
    private String user_Id;
    private String cBoardContent;
    private Date cBoardDate;
    private int communityId;
    private int cBoardLike;
    private String cBoardOrifile;
    private String cBoardRefile;
    private String cBoardNotice;

    public CBoard() {
    }

    public CBoard(String cBoardTitle, String userId, String cBoardContent, int communityId, int cBoardLike, String cBoardOrifile, String cBoardRefile, String cBoardNotice) {
        this.cBoardTitle = cBoardTitle;
        this.user_Id = userId;
        this.cBoardContent = cBoardContent;
        this.communityId = communityId;
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

    public String getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(String user_Id) {
        this.user_Id = user_Id;
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

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
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
                ", user_Id='" + user_Id + '\'' +
                ", cBoardContent='" + cBoardContent + '\'' +
                ", cBoardDate=" + cBoardDate +
                ", communityId=" + communityId +
                ", cBoardLike=" + cBoardLike +
                ", cBoardOrifile='" + cBoardOrifile + '\'' +
                ", cBoardRefile='" + cBoardRefile + '\'' +
                ", cBoardNotice='" + cBoardNotice + '\'' +
                '}';
    }
}

