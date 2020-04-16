package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.reservation.model.vo.Reservation;

public interface DriverService {

	ArrayList<Reservation> mibaechar(String mNO);

	ArrayList<Reservation> myBaechar(String mNo);

	ArrayList<Reservation> driverCal(String mNo);

	ArrayList<Reservation> driverModal(String rNo);

	int Deal(Reservation aa);

	int getListCount(String mNo);

	ArrayList<Reservation> selectList(String mNo,PageInfo pi);

	int cancel(Reservation aa);

	int getMyCount(String mNo);

	ArrayList<Reservation> myDetail(String mNo, PageInfo pi);
	
}
