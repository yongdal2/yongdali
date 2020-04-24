package com.kh.yongdali.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * Member List
	 * @param pi
	 * @return
	 */
	public int getMemListCount() {
		return sqlSession.selectOne("adminMapper.getMemListCount");
	}

	public ArrayList<Member> selectMemList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds =new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemList", null, rowBounds);
	}


	/** 
	 * Driver List
	 * @param pi
	 * @return
	 */
	public int getDriListCount() {
		return sqlSession.selectOne("adminMapper.getDriListCount");
	}

	public ArrayList<Driver> selectDriList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds =new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectDriList", null, rowBounds);
	}
	

	/**
	 * Reservation List
	 * @param pi
	 * @return
	 */
	public int getResListCount() {
		return sqlSession.selectOne("adminMapper.getResListCount");
	}

	public ArrayList<Reservation> selectResList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectResList",null,rowBounds);
	}

	public int selectJungListCount() {
		return sqlSession.selectOne("calculateMapper.selectJungCount");
	}

	public ArrayList<Calculate> calList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("calculateMapper.calList",null,rowBounds);
	}

	public int reserList() {
		return sqlSession.selectOne("reservationMapper.calcRCount");
	}

	public ArrayList<Reservation> reserList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.calList",null,rowBounds);
	}

	public int jungsan(String rNo) {
		return sqlSession.update("calculateMapper.jungsan",rNo);
	}


}
