package com.kh.yongdali.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.admin.model.vo.DriSearchCondition;
import com.kh.yongdali.admin.model.vo.MemSearchCondition;
import com.kh.yongdali.admin.model.vo.RefSearchCondition;
import com.kh.yongdali.admin.model.vo.adRefund;
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
	
	public int jungsan2(String rNo) {
	    return sqlSession.update("reservationMapper.jungsan2",rNo);
	}


	public int refundCount() {
		return sqlSession.selectOne("adminMapper.refundCount");
	}

	public ArrayList<adRefund> adRefundList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.refundList", null, rowBounds);
	}

	
	
	
	/** 
	 * 회원 검색
	 * @param pi
	 * @param sc
	 * @return
	 */
	public ArrayList<Member> searchMemberList(PageInfo pi, MemSearchCondition sc) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchMemberList", sc, rowBounds);
	}

	/**
	 * 기사님 검색
	 * @param pi
	 * @param sc
	 * @return
	 */
	public ArrayList<Driver> searchDriverList(PageInfo pi, DriSearchCondition sc) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchDriverList",sc,rowBounds);
	}

	
	
	/**
	 * 환불내역 리스트
	 * @param rNo
	 * @return
	 */
	public int adminRefund(String rNo) {
		return sqlSession.update("adminMapper.adminRefund",rNo);
	}

	/** 페이징 처리 빼고 
	 * 환불 내역에 rNo로 환불버튼 
	 * @param rNo
	 * @return
	 */
	public ArrayList<adRefund> adminRefundList() {
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminRefundList");
	}

	
	
	/**
	 * 환불 검색
	 * @param rNo
	 * @return
	 */
	public ArrayList<adRefund> searchRefundList(PageInfo pi, DriSearchCondition sc) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchRefundList",sc,rowBounds);
	}

	/**
	 * 환불 시 검색 내역 리스트
	 * @return
	 */
	public int refListCount() {
		return sqlSession.selectOne("adminMapper.getrefListCount");
	}

	public ArrayList<adRefund> searchAdminRefund(PageInfo pi, RefSearchCondition sc) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchAdminRefund",sc,rowBounds);
	}

	
	

	

	
	

}
