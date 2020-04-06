package com.kh.yongdali.driver.model.service;

import java.util.ArrayList;

import com.kh.yongdali.driver.model.vo.Reservation;

public interface DriverService {

	ArrayList<Reservation> mibaechar(int dId);

	ArrayList<Reservation> myBaechar(int dId);
	
}
