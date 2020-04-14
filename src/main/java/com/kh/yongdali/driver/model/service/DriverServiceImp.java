package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.driver.model.dao.DriverDao;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Service("dService")
public class DriverServiceImp implements DriverService{
	@Autowired
	DriverDao dDao = new DriverDao();
	
	@Override
	public ArrayList<Reservation> mibaechar(String mNo) {
		
		return dDao.mibaechar(mNo);
	}

	@Override
	public ArrayList<Reservation> myBaechar(int dId) {
		
		return dDao.myBaechar(dId);
	}

	@Override
	public ArrayList<Reservation> driverCal(int dId) {
		
		return dDao.driverCal(dId);
	}

	@Override
	public ArrayList<Reservation> driverModal(String rNo) {
		
		return dDao.driverModal(rNo);
	}

	@Override
	public int Deal(Reservation aa) {
		return dDao.Deal(aa);
	}



}
