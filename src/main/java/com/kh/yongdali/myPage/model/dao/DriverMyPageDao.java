package com.kh.yongdali.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.driver.model.vo.Driver;

@Repository("dmpDao")
public class DriverMyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateProfileImg(Driver d) {
		return sqlSession.update("myPageMapper.updateProfileImg",d);
	}

	public Driver truckInfoView(String mNo) {
		return sqlSession.selectOne("myPageMapper.truckInfoView",mNo);
	}
	
	

}
