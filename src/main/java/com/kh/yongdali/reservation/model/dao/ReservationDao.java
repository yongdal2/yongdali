package com.kh.yongdali.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.reservation.model.vo.Reservation;

@Repository("rDao")
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertReservation(Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation",r);
	}
	
}
