package com.kh.yongdali.myPage.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("mpDao")
public class MyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getAddrListCount() {
		
		return sqlSession.selectOne("myPageMapper.getAddrListCount");
	}

}
