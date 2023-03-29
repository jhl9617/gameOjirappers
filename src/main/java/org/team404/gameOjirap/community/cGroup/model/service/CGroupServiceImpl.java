package org.team404.gameOjirap.community.cGroup.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.community.cGroup.model.dao.CGroupDao;

@Service("cGroupService")
public class CGroupServiceImpl implements CGroupService{

    @Autowired
    CGroupDao cGroupDao;
}
