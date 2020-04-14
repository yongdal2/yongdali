package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.common.PageInfo;


public interface AdminService {
	
	/**
	 * Admin_Mem 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Member> selectList(PageInfo pi);

	int getMemListCount();

	
	

}
