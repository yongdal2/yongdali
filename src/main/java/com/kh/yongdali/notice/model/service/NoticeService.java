package com.kh.yongdali.notice.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.notice.model.vo.Notice;

public interface NoticeService {
	/**
	 * 1_1. 사용자 게시판 총 갯수 조회
	 * @return
	 */
	int userGetListCount();

	/**
	 * 1_2. 사용자 게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Notice> userSelectList(PageInfo pi);

	/**
	 * 2_1. 사용자 게시판 상세보기
	 * @param nNo
	 * @return
	 */
	Notice userSelectNoticeDetail(String nNo);

	/**
	 * 2_2. 사용자 게시판 상세보기 내 이전글
	 * @param nNo
	 * @return
	 */
	Notice userSelectPreList(String nNo);

	/**
	 * 2_3. 사용자 게시판 상세보기 내 다음글
	 * @param nNo
	 * @return
	 */
	Notice userSelectNextList(String nNo);

	/**
	 * 3. 게시판 등록하기
	 * @param n
	 * @return
	 */
	int insertNotice(Notice n);
}
