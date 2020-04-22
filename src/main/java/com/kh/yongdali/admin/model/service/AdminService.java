package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;


public interface AdminService {
	
	/**
	 * Admin_Mem 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Member> selectMemList(PageInfo pi);

	int getMemListCount();

	ArrayList<Driver> selectDriList(PageInfo pi);
	
	int getDriListCount();



	
	
	/* ArrayList<Driver> selectList(PageInfo pi); */
	

}
