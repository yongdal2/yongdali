package com.kh.yongdali.driver.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.driver.model.vo.Reservation;

@Repository("dDao")
public class DriverDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Reservation> mibaechar(int dId) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.mibaechar",dId);
	}

}
