package com.kh.yongdali.cs.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.cs.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 사용자 게시판 갯수 가져오기
	 * @return
	 */
	public int userGetListCount() {
		
		return sqlSession.selectOne("noticeMapper.userGetListCount");
	}

	/**
	 * 사용자 게시판 목록
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> userSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.userSelectList",null,rowBounds);
	}

	/**
	 * 게시물 상세보기 
	 * @param nNo
	 * @return
	 */
	public Notice selectNoticeDetail(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeDetail", nNo);
	}

	/**
	 * 게시물 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	public Notice userSelectPreList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.userSelectPreList",nNo);
	}

	/**
	 * 게시물 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	public Notice userSelectNextList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.userSelectNextList",nNo);
	}

	public int insertNotice(Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public int updateNotice(Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice",n);
	}

	public int deleteNotice(String nNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice",nNo);
	}

	public int userSearchGetListCount(String keyword) {
		
		return sqlSession.selectOne("noticeMapper.userSearchGetListCount", keyword);
	}

	public ArrayList<Notice> userSearchSelectList(PageInfo pi,String keyword) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.userSearchSelectList",keyword,rowBounds);
	}

	/*
	 * -----------------기사 service
	 */
	
	public int driverGetListCount() {
		
		return sqlSession.selectOne("noticeMapper.driverGetListCount");
	}

	public ArrayList<Notice> driverSelectList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
				
		return (ArrayList)sqlSession.selectList("noticeMapper.driverSelectList",null,rowBounds);
	}

	public Notice driverSelectPreList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.driverSelectPreList",nNo);
	}

	public Notice driverSelectNextList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.driverSelectNextList",nNo);
	}

}
