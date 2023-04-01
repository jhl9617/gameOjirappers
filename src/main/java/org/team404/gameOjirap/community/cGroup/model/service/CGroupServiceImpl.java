package org.team404.gameOjirap.community.cGroup.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.dao.CGroupDao;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;

import java.util.ArrayList;

@Service("cGroupService")
public class CGroupServiceImpl implements CGroupService{

    @Autowired
    CGroupDao cGroupDao;

    @Override
    public int selectListCount() {
        return cGroupDao.selectListCount();
    }

    @Override
    public int insertCGroup(CGroup newGroup) {
        return cGroupDao.insertCGroup(newGroup);
    }

    @Override
    public int updateCGroup(CGroup cGroup) {
        return 0;
    }

    @Override
    public int deleteCGroup(CGroup cGroup) {
        return 0;
    }

    @Override
    public CGroup selectSingleCGroup(int communityId) {
        return null;
    }

    @Override
    public ArrayList<CGroup> selectMain10() {
        return null;
    }

    @Override
    public int insertCMember(CMember cMember, CGroup cGroup) {
        return cGroupDao.insertCMember(cMember, cGroup);
    }

    @Override
    public int selectCGroup(String communityname) {
        return cGroupDao.selectCGroup(communityname);
    }

    @Override
    public ArrayList<CGroup> selectList(Paging paging) {
        return cGroupDao.selectList(paging);
    }
}
