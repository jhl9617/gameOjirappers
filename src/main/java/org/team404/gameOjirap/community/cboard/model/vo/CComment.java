package org.team404.gameOjirap.community.cboard.model.vo;

import java.sql.Date;

public class CComment {
    private int cComNo;
    private String cComContent;
    private Date cComDate;
    private int cComLvl;
    private String user_id;
    private String cBoardNo;

    public CComment() {
    }

    public int getcComNo() {
        return cComNo;
    }

    public void setcComNo(int cComNo) {
        this.cComNo = cComNo;
    }

    public String getcComContent() {
        return cComContent;
    }

    public void setcComContent(String cComContent) {
        this.cComContent = cComContent;
    }

    public Date getcComDate() {
        return cComDate;
    }

    public void setcComDate(Date cComDate) {
        this.cComDate = cComDate;
    }

    public int getcComLvl() {
        return cComLvl;
    }

    public void setcComLvl(int cComLvl) {
        this.cComLvl = cComLvl;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getcBoardNo() {
        return cBoardNo;
    }

    public void setcBoardNo(String cBoardNo) {
        this.cBoardNo = cBoardNo;
    }

    @Override
    public String toString() {
        return "CComment{" +
                "cComNo=" + cComNo +
                ", cComContent='" + cComContent + '\'' +
                ", cComDate=" + cComDate +
                ", cComLvl=" + cComLvl +
                ", user_id='" + user_id + '\'' +
                ", cBoardNo='" + cBoardNo + '\'' +
                '}';
    }
}

