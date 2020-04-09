package com.kh.yongdali.cs.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.cs.model.vo.Notice;

public interface NoticeService {
	/**
	 * (사용자) 게시판 총 갯수 조회
	 * @return
	 */
	int userGetListCount();

	/**
	 * (사용자) 게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Notice> userSelectList(PageInfo pi);

	/**
	 * (공통) 게시판 상세보기
	 * @param nNo
	 * @return
	 */
	Notice selectNoticeDetail(String nNo);

	/**
	 * (사용자) 게시판 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	Notice userSelectPreList(String nNo);

	/**
	 * (사용자) 게시판 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	Notice userSelectNextList(String nNo);

	/**
	 * (공통) 게시판 등록하기
	 * @param n
	 * @return
	 */
	int insertNotice(Notice n);

	/**
	 * (공통) 공지사항 수정
	 * @param nNo
	 * @return
	 */
	Notice selectUpdateNotice(String nNo);
	int updateNotice(Notice n);

	/**
	 * (공통) 공지사항 삭제
	 * @param nNo
	 * @return
	 */
	int deleteNotice(String nNo);

	/**
	 * (사용자) 검색한 게시글 수 
	 * @return
	 */
	int userSearchGetListCount(String keyword);

	/**
	 * (사용자) 검색한 게시글 출력
	 * @param pi
	 * @return
	 */
	ArrayList<Notice> userSearchSelectList(PageInfo pi,String keyword);

	/*
	 * -----------------기사 service
	 */
	
	
	/**
	 * (기사) 게시판 총 갯수 조회
	 * @return
	 */
	int driverGetListCount();

	/**
	 * (기사) 게시판 리스트
	 * @param pi
	 * @return
	 */
	ArrayList<Notice> driverSelectList(PageInfo pi);

	/**
	 * (기사) 게시판 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	Notice driverSelectPreList(String nNo);

	/**
	 * (기사) 게시판 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	Notice driverSelectNextList(String nNo);

	/**
	 * (기사) 검색한 게시글 수
	 * @param keyword
	 * @return
	 */
	int driverSearchGetListCount(String keyword);

	/**
	 * (기사) 검색한 게시글
	 * @param pi
	 * @param keyword
	 * @return
	 */
	ArrayList<Notice> driverSearchSelectList(PageInfo pi, String keyword);

	int deleteFile(String nNo);
}
