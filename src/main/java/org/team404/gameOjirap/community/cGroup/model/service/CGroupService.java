package org.team404.gameOjirap.community.cGroup.model.service;

import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;

import java.util.ArrayList;

public interface CGroupService {
     int insertCGroup(CGroup newGroup);
     int updateCGroup(CGroup cGroup);
     int deleteCGroup(CGroup cGroup);
     CGroup selectSingleCGroup(int communityId);

     ArrayList<CGroup> selectMain10();
}
