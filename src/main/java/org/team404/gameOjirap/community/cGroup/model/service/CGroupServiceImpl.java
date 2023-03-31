package org.team404.gameOjirap.community.cGroup.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.community.cGroup.model.dao.CGroupDao;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;

import java.util.ArrayList;

@Service("cGroupService")
public class CGroupServiceImpl implements CGroupService{

    @Autowired
    CGroupDao cGroupDao;

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
}
