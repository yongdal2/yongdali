package com.kh.yongdali.myPage.model.dao;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.myPage.model.vo.Address;


@Repository("umpDao")
public class UserMyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getAddrListCount(String mNo) {
		
		return sqlSession.selectOne("myPageMapper.getAddrListCount",mNo);
	}

	public ArrayList<Address> selectAddrList(String mNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectAddrList",mNo);
	}

	public Address getUpAddr(String aNo) {
		return sqlSession.selectOne("myPageMapper.getUpAddr", aNo);
	}

	public int updateAddr(Address a) {
		return sqlSession.update("myPageMapper.updateAddr", a);
	}

	public int insertAddr(Address a) {
		return sqlSession.insert("myPageMapper.insertAddr",a);
	}

	public int deleteAddr(String aNo) {
		return sqlSession.delete("myPageMapper.deleteAddr", aNo);
	}

}