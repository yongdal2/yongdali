//AdminService를 interface로 만들고 Impl파일을 add해서 Matching
package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.admin.model.dao.AdminDao;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.admin.model.vo.DriSearchCondition;
import com.kh.yongdali.admin.model.vo.MemSearchCondition;
import com.kh.yongdali.admin.model.vo.adRefund;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.common.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao aDao;


	@Override
	public int getMemListCount() {
		return aDao.getMemListCount();
	}

	@Override
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return aDao.selectMemList(pi);
	}

	@Override
	public int getDriListCount() {
		return aDao.getDriListCount();
	}

	@Override
	public ArrayList<Driver> selectDriList(PageInfo pi) {
		return aDao.selectDriList(pi);
	}

	@Override
	public int getResListCount() {
		return aDao.getResListCount();
	}

	@Override
	public ArrayList<Reservation> selectResList(PageInfo pi) {
		return aDao.selectResList(pi);
	}

	@Override
	public int getJungListCount() {
		return aDao.selectJungListCount();
	}

	@Override
	public ArrayList<Calculate> calList(PageInfo pi) {
		return aDao.calList(pi);
	}

	@Override
	public int reserCount() {
		return aDao.reserList();
	}

	@Override
	public ArrayList<Reservation> reserList(PageInfo pi) {
		return aDao.reserList(pi);
	}

	@Override
	public int jungsan(String rNo) {
		return aDao.jungsan(rNo);
	}

	@Override
	   public int junsan2(String rNo) {
	      return aDao.jungsan2(rNo);
	}
	
	
	@Override
	public int refundCount() {
		return aDao.refundCount();
	}

	@Override
	public ArrayList<adRefund> adRefundList(PageInfo pi) {
		return aDao.adRefundList(pi);
	}

	/**
	 *회원 검색
	 */
	@Override
	public ArrayList<Member> searchMemberList(PageInfo pi, MemSearchCondition sc) {
		return aDao.searchMemberList(pi, sc);
	}

	@Override
	public ArrayList<Driver> searchDriverList(DriSearchCondition sc, PageInfo pi) {
		return aDao.searchDriverList(pi,sc);
	}

	@Override
	public int adminRefund(String rNo) {
		return aDao.adminRefund(rNo);
	}

	@Override
	public ArrayList<adRefund> adminRefundList() {
		return aDao.adminRefundList();
	}

	/*
	 * @Override public int getRefListCount() { return aDao.(); }
	 */





}