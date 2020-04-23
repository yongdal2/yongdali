//AdminService를 interface로 만들고 Impl파일을 add해서 Matching
package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.admin.model.dao.AdminDao;
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



}