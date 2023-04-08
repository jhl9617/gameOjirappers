package org.team404.gameOjirap.community.cGroup.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.dao.CGroupDao;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.community.cGroup.model.vo.CReport;
import org.team404.gameOjirap.community.cGroup.model.vo.CommunityReq;

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
        return cGroupDao.updateCGroup(cGroup);
    }

    @Override
    public int deleteCGroup(int communityId){
    return cGroupDao.deleteCGroup(communityId);
    }

    @Override
    public CGroup selectSingleCGroup(int communityId) {
        return cGroupDao.selectSingleCGroup(communityId);
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

    @Override
    public int insertRequest(CommunityReq req) {
        return cGroupDao.insertRequest(req);
    }

    @Override
    public ArrayList<CommunityReq> selectRequests(int communityid) {
        return cGroupDao.selectRequests(communityid);
    }

    @Override
    public CommunityReq selectRequest(int reqno) {
        return cGroupDao.selectRequest(reqno);
    }

    @Override
    public int deleteRequest(int reqno) {
        return cGroupDao.deleteRequest(reqno);
    }

    @Override
    public ArrayList<CMember> selectMembers(int communityid) {
        return cGroupDao.selectMembers(communityid);
    }

    @Override
    public int deleteMember(CMember cmember) {
        return cGroupDao.deleteMember(cmember);
    }

    @Override
    public ArrayList<CGroup> searchCGroup(String keyword, Paging paging) {
        return cGroupDao.searchCGroup(keyword, paging);
    }

    @Override
    public int searchCGroupCount(String keyword) {
        return cGroupDao.searchCGroupCount(keyword);

    }
}
