package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import com.kh.yongdali.reservation.model.vo.Reservation;

public interface DriverService {

	ArrayList<Reservation> mibaechar(String mNO);

	ArrayList<Reservation> myBaechar(int dId);

	ArrayList<Reservation> driverCal(int dId);
	
}
