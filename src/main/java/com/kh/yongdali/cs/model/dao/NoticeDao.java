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
	 * (사용자) 게시판 갯수 가져오기
	 * @return
	 */
	public int userGetListCount() {
		
		return sqlSession.selectOne("noticeMapper.userGetListCount");
	}

	/**
	 * (사용자) 게시판 목록
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> userSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.userSelectList",null,rowBounds);
	}

	/**
	 * (공통) 게시물 상세보기 
	 * @param nNo
	 * @return
	 */
	public Notice selectNoticeDetail(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeDetail", nNo);
	}

	/**
	 * (사용자) 게시물 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	public Notice userSelectPreList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.userSelectPreList",nNo);
	}

	/**
	 * (사용자) 게시물 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	public Notice userSelectNextList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.userSelectNextList",nNo);
	}

	/**
	 * (공통) 게시물 등록
	 * @param n
	 * @return
	 */
	public int insertNotice(Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	/**
	 * (공통) 게시물 수정
	 * @param n
	 * @return
	 */
	public int updateNotice(Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice",n);
	}

	/**
	 * (공통) 게시물 삭제
	 * @param nNo
	 * @return
	 */
	public int deleteNotice(String nNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice",nNo);
	}

	/**
	 * (사용자) 게시물 검색한 글 수
	 * @param keyword
	 * @return
	 */
	public int userSearchGetListCount(String keyword) {
		
		return sqlSession.selectOne("noticeMapper.userSearchGetListCount", keyword);
	}

	/**
	 * (사용자) 게시물 검색한 리스트
	 * @param pi
	 * @param keyword
	 * @return
	 */
	public ArrayList<Notice> userSearchSelectList(PageInfo pi,String keyword) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.userSearchSelectList",keyword,rowBounds);
	}

	/*
	 * -----------------기사 service
	 */
	
	/**
	 * (기사) 게시물 갯수 가져오기
	 * @return
	 */
	public int driverGetListCount() {
		
		return sqlSession.selectOne("noticeMapper.driverGetListCount");
	}

	/**
	 * (기사) 게시물 리스트
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> driverSelectList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
				
		return (ArrayList)sqlSession.selectList("noticeMapper.driverSelectList",null,rowBounds);
	}

	/**
	 * (기사) 게시물 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	public Notice driverSelectPreList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.driverSelectPreList",nNo);
	}

	/**
	 * (기사) 게시물 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	public Notice driverSelectNextList(String nNo) {
		
		return sqlSession.selectOne("noticeMapper.driverSelectNextList",nNo);
	}

	/**
	 * (기사) 게시물 검색한 글 수
	 * @param keyword
	 * @return
	 */
	public int driverSearchGetListCount(String keyword) {
		
		return sqlSession.selectOne("noticeMapper.driverSearchGetListCount",keyword);
	}

	/**
	 * (기사) 게시물 검색한 리스트
	 * @param pi
	 * @param keyword
	 * @return
	 */
	public ArrayList<Notice> driverSearchSelectList(PageInfo pi, String keyword) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.driverSearchSelectList",keyword,rowBounds);
	}

}
