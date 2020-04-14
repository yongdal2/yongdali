package com.kh.yongdali.reservation.model.service;

import java.util.ArrayList;

import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.reservation.model.vo.Reservation;

public interface ReservationService {

	public ArrayList<Address> getAddressList(String mno);
	
	public int insertReservation(Reservation r);

}
