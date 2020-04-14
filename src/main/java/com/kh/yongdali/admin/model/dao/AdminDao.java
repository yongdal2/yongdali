package com.kh.yongdali.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.common.PageInfo;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getMemListCount() {
		return sqlSession.selectOne("adminMapper.getMemListCount");
	}

	public ArrayList<Member> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds =new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemList", null, rowBounds);
	}

}
