package com.kh.yongdali.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.reservation.model.dao.ReservationDao;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Service("rService")
public class ReservationServiceEmpl implements ReservationService{

	@Autowired
	private ReservationDao rDao;
	
	@Override
	public int insertReservation(Reservation r) {
		return rDao.insertReservation(r);
	}

	@Override
	public ArrayList<Address> getAddressList(String mno) {
		return rDao.getAddressList(mno);
	}

	@Override
	public int insertPayment() {
		return rDao.insertPayment();
	}
}
