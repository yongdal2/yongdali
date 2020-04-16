package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.dao.DriverDao;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Service("dService")
public class DriverServiceImp implements DriverService{
	@Autowired
	DriverDao dDao = new DriverDao();
	
	/**
	 * 미배차 간략히 보기
	 */
	@Override
	public ArrayList<Reservation> mibaechar(String mNo) {
		
		return dDao.mibaechar(mNo);
	}

	/**
	 *	내 예약 간략히보기
	 */
	@Override
	public ArrayList<Reservation> myBaechar(String mNo) {
		
		return dDao.myBaechar(mNo);
	}

	/**
	 * 달력용 일정 호출
	 */
	@Override
	public ArrayList<Reservation> driverCal(String mNo) {
		
		return dDao.driverCal(mNo);
	}

	/**
	 * 모달팝업용
	 */
	@Override
	public ArrayList<Reservation> driverModal(String rNo) {
		
		return dDao.driverModal(rNo);
	}

	/**
	 * 배차신청
	 */
	@Override
	public int Deal(Reservation aa) {
		return dDao.Deal(aa);
	}

	/**
	 *	페이징 처리용 글 수
	 */
	@Override
	public int getListCount(String mNo) {
		
		return dDao.getListCount(mNo);
	}

	/**
	 *	미배차예약 전체보기
	 */
	@Override
	public ArrayList<Reservation> selectList(String mNo, PageInfo pi) {
		
		return dDao.baeList(mNo,pi);
	}

	@Override
	public int cancel(Reservation aa) {
		return dDao.cancel(aa);
	}

	@Override
	public int getMyCount(String mNo) {
		return dDao.getMyCount(mNo);
	}

	@Override
	public ArrayList<Reservation> myDetail(String mNo, PageInfo pi) {
		return dDao.myDetail(mNo,pi);
	}



}
