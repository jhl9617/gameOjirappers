package org.team404.gameOjirap.community.community.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.community.community.model.dao.CommunityDao;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{

    @Autowired
    private CommunityDao communityDao;
}
