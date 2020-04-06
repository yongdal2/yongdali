package com.kh.yongdali.member.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.Notice;
import com.kh.yongdali.common.PageInfo;

public interface MemberService_lth {

	/**
	 * 1_1. 게시판 총 갯수 조회
	 * @return
	 */
	int getListCount();

	/**
	 * 1_2. 게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Notice> selectList(PageInfo pi);

	Notice selectNoticeDetail(String nNo);

	Notice selectPreList(String nNo);

	Notice selectNextList(String nNo);

}
