package org.team404.gameOjirap.community.cGroup.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cGroupDao")
public class CGroupDao {

    @Autowired  //root-context.xml 에서 생성한 객체와 자동 연결
    private SqlSessionTemplate session;  //의존성 주입됨(DI)

}
