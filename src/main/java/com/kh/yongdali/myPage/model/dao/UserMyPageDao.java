package com.kh.yongdali.myPage.model.dao;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.payment.model.vo.Payment;
import com.kh.yongdali.reservation.model.vo.Reservation;


@Repository("umpDao")
public class UserMyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int updatePhone(Member m) {
		return sqlSession.update("myPageMapper.updatePhone",m);
	}
	
	
	public int getAddrListCount(String mNo) {
		return sqlSession.selectOne("myPageMapper.getAddrListCount",mNo);
	}

	public ArrayList<Address> selectAddrList(String mNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectAddrList",mNo);
	}

	public Address getUpAddr(String aNo) {
		return sqlSession.selectOne("myPageMapper.getUpAddr", aNo);
	}

	public int updateAddr(Address a) {
		return sqlSession.update("myPageMapper.updateAddr", a);
	}

	public int insertAddr(Address a) {
		return sqlSession.insert("myPageMapper.insertAddr",a);
	}

	public int deleteAddr(String aNo) {
		return sqlSession.delete("myPageMapper.deleteAddr", aNo);
	}


	public int getRsvListCount(Filter f) {
		return sqlSession.selectOne("myPageMapper.getListCount",f);
	}


	public ArrayList<Reservation> selectRsvList(PageInfo pi, Filter f) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.seLectList", f, rowBounds);
	}


	public Driver getRsvDinfo(String dNo) {
		return sqlSession.selectOne("myPageMapper.getRsvDinfo",dNo);
	}

	public int upRSVmsg(Reservation r) {
		return sqlSession.update("myPageMapper.upRSVmsg", r);
	}


	public Reservation rDetail(String rNo) {
		return sqlSession.selectOne("myPageMapper.rDetail", rNo);
	}


	public Reservation pDetail(String rNo) {
		return sqlSession.selectOne("myPageMapper.pDetail", rNo);
	}


	public int rsvCan(Payment p) {
		
		return sqlSession.update("myPageMapper.rscCanPayment",p);
	}


	public int pushUpdate(Member m) {
		return sqlSession.update("myPageMapper.pushUpdate",m);
	}


	public int addrSys(String aNo) {
		return sqlSession.update("myPageMapper.addrSys", aNo);
	}


	public int uPwd(Member m) {
		return sqlSession.update("myPageMapper.uPwd",m);
	}

	

}
