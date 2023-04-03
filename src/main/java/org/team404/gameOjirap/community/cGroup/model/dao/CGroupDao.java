package org.team404.gameOjirap.community.cGroup.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;

import java.util.ArrayList;
import java.util.List;


@Repository("cGroupDao")
public class CGroupDao {

    @Autowired  //root-context.xml 에서 생성한 객체와 자동 연결
    private SqlSessionTemplate session;  //의존성 주입됨(DI)


    //커뮤 이름이 중복인지 확인
    public int selectCGroup(String communityname) {
      return session.selectOne("CGroupMapper.selectCommuInvalid", communityname);
    }


    //커뮤 생성
    public int insertCGroup(CGroup newGroup) {
        return session.insert("CGroupMapper.insertCGroup", newGroup);
    }

    public int insertCMember(CMember cMember, CGroup cGroup) {

        //방금생성한 밴드 번호를 알아와서 cMember에 넣어야함
        int communityid = session.selectOne("CGroupMapper.selectCommunityid", cGroup.getCommunityname());
        cMember.setCommunityid(communityid);
        return session.insert("CGroupMapper.insertCMember", cMember);
    }


    public int selectListCount() {
        return session.selectOne("CGroupMapper.selectcgroupcount");
    }

    public ArrayList<CGroup> selectList(Paging paging) {
        List<CGroup> list = session.selectList("CGroupMapper.selectcgrouplist", paging);
        return (ArrayList<CGroup>) list;
    }

    public CGroup selectSingleCGroup(int communityId) {
        return session.selectOne("CGroupMapper.selectcgroup", communityId);
    }
}
