package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.driver.model.dao.DriverDao;
import com.kh.yongdali.driver.model.vo.Reservation;

@Service("dService")
public class DriverServiceImp implements DriverService{
	@Autowired
	DriverDao dDao = new DriverDao();
	
	@Override
	public ArrayList<Reservation> mibaechar(int dId) {
		
		return dDao.mibaechar(dId);
	}

	@Override
	public ArrayList<Reservation> myBaechar(int dId) {
		
		return dDao.myBaechar(dId);
	}

}
