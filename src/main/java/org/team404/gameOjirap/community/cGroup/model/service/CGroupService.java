package org.team404.gameOjirap.community.cGroup.model.service;

import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;

import java.util.ArrayList;

public interface CGroupService {
    int selectListCount();

    int insertCGroup(CGroup newGroup);
     int updateCGroup(CGroup cGroup);
     int deleteCGroup(CGroup cGroup);
     CGroup selectSingleCGroup(int communityId);

     ArrayList<CGroup> selectMain10();

    int insertCMember(CMember cMember, CGroup cgroup);

     int selectCGroup(String communityname);


    ArrayList<CGroup> selectList(Paging paging);


}
