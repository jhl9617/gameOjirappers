package org.team404.gameOjirap.community.cGroup.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.community.cGroup.model.vo.CReport;
import org.team404.gameOjirap.community.cGroup.model.vo.CommunityReq;


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

    public int insertRequest(CommunityReq req) {
        return session.insert("CGroupMapper.insertRequest", req);
    }

    public ArrayList<CommunityReq> selectRequests(int communityid) {
        List<CommunityReq> list = session.selectList("CGroupMapper.selectRequests", communityid);
        return (ArrayList<CommunityReq>) list;
    }

    public CommunityReq selectRequest(int reqno) {
        return session.selectOne("CGroupMapper.selectRequest", reqno);
    }

    public int deleteRequest(int reqno) {
        return session.delete("CGroupMapper.deleteRequest", reqno);
    }

    public ArrayList<CMember> selectMembers(int communityid) {
        List<CMember> list = session.selectList("CGroupMapper.selectMembers", communityid);
        return (ArrayList<CMember>) list;
    }

    public int deleteMember(CMember cmember) {
        return session.delete("CGroupMapper.deleteMember", cmember);
    }

    public int updateCGroup(CGroup cGroup) {
        return session.update("CGroupMapper.updateCGroup", cGroup);
    }

    public int deleteCGroup(int communityId) {
        return session.delete("CGroupMapper.deleteCGroup", communityId);
    }


    public int searchCGroupCount(String keyword) {
        return session.selectOne("CGroupMapper.searchCGroupCount", keyword);
    }

    public ArrayList<CGroup> searchCGroup(String keyword, Paging paging) {
        Map<String, Object> map = Map.of("keyword", keyword, "paging", paging);
        List<CGroup> list = session.selectList("CGroupMapper.searchCGroup", map);
        return (ArrayList<CGroup>) list;
    }

    public int insertReport(CReport cReport) {
        return session.insert("CGroupMapper.insertReport", cReport);
    }



	public ArrayList<CReport> selectCReportList() {
		List<CReport> list = session.selectList("CGroupMapper.selectCReportList");
		return (ArrayList<CReport>)list;
	}

    public int selectMemberListCount(int communityid) {
        return session.selectOne("CGroupMapper.selectMemberListCount", communityid);
    }

    public int deleteCMember(int communityid) {
        return session.delete("CGroupMapper.deleteCMember", communityid);
    }
}
