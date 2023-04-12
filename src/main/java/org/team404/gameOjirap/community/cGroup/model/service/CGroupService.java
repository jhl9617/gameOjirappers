package org.team404.gameOjirap.community.cGroup.model.service;

import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.community.cGroup.model.vo.CReport;
import org.team404.gameOjirap.community.cGroup.model.vo.CommunityReq;

import java.util.ArrayList;

public interface CGroupService {
    int selectListCount();

    int insertCGroup(CGroup newGroup);
     int updateCGroup(CGroup cGroup);
     int deleteCGroup(int communityId);
     CGroup selectSingleCGroup(int communityId);

     ArrayList<CGroup> selectMain10();

    int insertCMember(CMember cMember, CGroup cgroup);

     int selectCGroup(String communityname);


    ArrayList<CGroup> selectList(Paging paging);


    int insertRequest(CommunityReq req);

    ArrayList<CommunityReq> selectRequests(int communityid);

    CommunityReq selectRequest(int reqno);

    int deleteRequest(int reqno);

    // 커뮤니티 id 로 멤버정보 조회
    ArrayList<CMember> selectMembers(int communityid);

    int deleteMember(CMember cmember);


    ArrayList<CGroup> searchCGroup(String keyword, Paging paging);

    int searchCGroupCount(String keyword);

    int insertReport(CReport cReport);

    int selectMemberListCount(int communityid);
}
