package com.kh.yongdali.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.common.Notice;
import com.kh.yongdali.common.PageInfo;

@Repository("mDaoL")
public class MemberDao_lth {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectListUser",null,rowBounds);
	}

	public Notice selectNoticeDatail(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeUser", nNo);
	}

	/**
	 * 게시물 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	public Notice selectPreList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.selectPreList",nNo);
	}

	/**
	 * 게시물 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	public Notice selectNextList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNextList",nNo);
	}

}
