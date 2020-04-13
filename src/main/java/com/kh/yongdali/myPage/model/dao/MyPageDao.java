package com.kh.yongdali.myPage.model.dao;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.myPage.model.vo.Address;


@Repository("mpDao")
public class MyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getAddrListCount(String mNo) {
		
		return sqlSession.selectOne("myPageMapper.getAddrListCount",mNo);
	}

	public ArrayList<Address> selectAddrList(String mNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectAddrList",mNo);
	}

	public Address getEditAddr(String aNo) {
		return sqlSession.selectOne("myPageMapper.getEditAddr", aNo);
	}

}
