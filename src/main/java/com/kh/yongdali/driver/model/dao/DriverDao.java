package com.kh.yongdali.driver.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.reservation.model.vo.Reservation;

@Repository("dDao")
public class DriverDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Reservation> mibaechar(String mNo) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.mibaechar",mNo);
	}

	public ArrayList<Reservation> myBaechar(int dId) {
		return (ArrayList)sqlSession.selectList("reservationMapper.myBaechar",dId);
	}

	public ArrayList<Reservation> driverCal(String mNo) {

		return (ArrayList)sqlSession.selectList("reservationMapper.driverCal",mNo);
	}

	public ArrayList<Reservation> driverModal(String rNo) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.driverModal",rNo);
	}

	public int Deal(Reservation aa) {
		return sqlSession.update("reservationMapper.deal",aa);
	}

}
