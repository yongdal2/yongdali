package com.kh.yongdali.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
