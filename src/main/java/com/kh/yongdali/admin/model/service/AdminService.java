package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.admin.model.vo.adRefund;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;


public interface AdminService {
	
	int getMemListCount();

	/**
	 * Admin_Mem 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Member> selectMemList(PageInfo pi);

	
	
	int getDriListCount();

	/**
	 * Admin_Dri 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Driver> selectDriList(PageInfo pi);
	

	
	int getResListCount();

	/**
	 * Reservation 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Reservation> selectResList(PageInfo pi);

	int getJungListCount();

	ArrayList<Calculate> calList(PageInfo pi);

	int reserCount();

	ArrayList<Reservation> reserList(PageInfo pi);

	int jungsan(String rNo);

	
	
	
	
	
	int refundCount();

	/**
	 * 환불 내역
	 * @param pi
	 * @return
	 */
	ArrayList<adRefund> adRefundList(PageInfo pi);


	
	
	

}
