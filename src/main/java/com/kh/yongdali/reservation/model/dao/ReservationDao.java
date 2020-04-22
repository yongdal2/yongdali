package com.kh.yongdali.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Repository("rDao")
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertReservation(Reservation r) {
		return sqlSession.insert("reservationMapper_njh.insertReservation",r);
	}

	public ArrayList<Address> getAddressList(String mno) {
		return (ArrayList)sqlSession.selectList("addressMapper_njh.selectAddressList",mno);
	}

	public int insertPayment() {
		return sqlSession.insert("paymentMapper_njh.insertPayment");
	}
	
}
