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
	public String insertReservation(Reservation r) {
		int result = rDao.insertReservation(r);
		
		if(result > 0){
//			return rDao.selectRNO(r)
		} else {
			System.out.println("불어오는데 실패하였습니다.");
		}
		return "";
	}
}
