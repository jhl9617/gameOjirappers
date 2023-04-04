package org.team404.gameOjirap.community.cboard.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Paging;
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

    public ArrayList<CComment> selectCommuCList(int cBoardNo) {
        List<CComment> list = session.selectList("cBoardMapper.selectCommuReply", cBoardNo);
        return (ArrayList<CComment>) list;
    }

    public int insertCommuReply(CComment cComment) {
        System.out.println(cComment);
        return session.insert("cBoardMapper.insertCommuReply", cComment);
    }
}
