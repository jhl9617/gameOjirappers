package org.team404.gameOjirap.community.cboard.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("cBoardDao")
public class CBoardDao {

    @Autowired
    private SqlSessionTemplate session;


    public int selectBListCount(int communityid) {
        return session.selectOne("cBoardMapper.selectBListCount", communityid);
    }

    public ArrayList<CBoard> selectCommuBList(Paging paging, int communityid) {
        Map<String, Object> params = new HashMap<>();
        params.put("paging", paging);
        params.put("communityid", communityid);

        List<CBoard> list = session.selectList("cBoardMapper.selectCommuBList", params);
        return (ArrayList<CBoard>) list;


        /*List<CBoard> list = session.selectList("cBoardMapper.selectCommuBList", paging);
        return (ArrayList<CBoard>) list;*/
    }

    public CBoard selectCommuPost(int cBoardNo) {
        return session.selectOne("cBoardMapper.selectCommuPost", cBoardNo);
    }

    public int insertCommuPost(CBoard cBoard) {
        return session.insert("cBoardMapper.insertCommuPost", cBoard);
    }

    public int updateCommuPost(CBoard cBoard) {
        return session.update("cBoardMapper.updateCommuPost", cBoard);
    }
    public int deleteCommuPost(int cBoardNo) {
        return session.delete("cBoardMapper.deleteCommuPost", cBoardNo);
    }

    public ArrayList<CComment> selectCommuCList(int cBoardNo) {


        List<CComment> list = session.selectList("cBoardMapper.selectCommuReply", cBoardNo);
        return (ArrayList<CComment>) list;
    }

    public int insertCommuReply(CComment cComment) {
        System.out.println(cComment);
        return session.insert("cBoardMapper.insertCommuReply", cComment);
    }

    public int updateCommuComment(CComment cComment) {
        return session.update("cBoardMapper.updateCommuComment", cComment);
    }

    public int deleteCommuComment(CComment cComment) {
        return session.delete("cBoardMapper.deleteCommuComment", cComment);
    }


    public int commuBoardSearchCount(String keyword, int communityid) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("communityid", communityid);
        return session.selectOne("cBoardMapper.commuBoardSearchCount", params);
    }

    public ArrayList<CBoard> commuBoardSearch(int communityid, String keyword, Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("paging", paging);
        params.put("communityid", communityid);

        List<CBoard> list = session.selectList("cBoardMapper.commuBoardSearch", params);
        return (ArrayList<CBoard>) list;
    }
}
