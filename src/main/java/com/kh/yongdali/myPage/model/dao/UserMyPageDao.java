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


	public int getRsvListCount(String mNo) {
		return sqlSession.selectOne("myPageMapper.selectRsvListCount",mNo);
	}


	public ArrayList<Reservation> selectRsvList(PageInfo pi, String mNo) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectRsvPayList", mNo, rowBounds);
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

	

}
