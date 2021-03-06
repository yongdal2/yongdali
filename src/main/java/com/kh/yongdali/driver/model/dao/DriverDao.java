package com.kh.yongdali.driver.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Repository("dDao")
public class DriverDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Reservation> mibaechar(String mNo) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.mibaechar",mNo);
	}

	public ArrayList<Reservation> myBaechar(String mNo) {
		System.out.println(mNo);
		return (ArrayList)sqlSession.selectList("reservationMapper.myBaechar",mNo);
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

	public int getListCount(String mNo) {
		return sqlSession.selectOne("reservationMapper.getListCount",mNo);
	}

	public ArrayList<Reservation> baeList(String mNo, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.baeList", mNo, rowBounds);
	}

	
	public int cancel(Reservation aa) {
		return sqlSession.update("reservationMapper.cancel",aa);
	}

	public int getMyCount(String mNo) {
		
		return sqlSession.selectOne("reservationMapper.getMyCount",mNo);
	}

	public ArrayList<Reservation> myDetail(String mNo, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.myDetail", mNo, rowBounds);
	}

}
