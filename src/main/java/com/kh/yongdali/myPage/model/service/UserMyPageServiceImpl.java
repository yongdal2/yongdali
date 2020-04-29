package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.dao.UserMyPageDao;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.payment.model.vo.Payment;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Service("umpService")
public class UserMyPageServiceImpl implements UserMyPageService {
	
	@Autowired
	private UserMyPageDao umpDao;

	@Override
	public int updatePhone(Member m) {
		return umpDao.updatePhone(m);
	}
	
	@Override
	public int pushUpdate(Member m) {
		return umpDao.pushUpdate(m);
	}
	
	@Override
	public int getAddrListCount(String mNo) {
		return umpDao.getAddrListCount(mNo);
	}

	@Override
	public ArrayList<Address> selectAddrList(String mNo) {
		return umpDao.selectAddrList(mNo);
	}

	@Override
	public Address getUpAddr(String aNo) {
		return umpDao.getUpAddr(aNo);
	}

	@Override
	public int updateAddr(Address a) {
		return umpDao.updateAddr(a);
	}

	@Override
	public int insertAddr(Address a) {
		return umpDao.insertAddr(a);
	}

	@Override
	public int deleteAddr(String aNo) {
		return umpDao.deleteAddr(aNo);
	}

	@Override
	public int getRsvListCount(Filter f) {
		return umpDao.getRsvListCount(f);
	}

	@Override
	public ArrayList<Reservation> selectRsvList(PageInfo pi, Filter f) {
		return umpDao.selectRsvList(pi, f);
	}

	@Override
	public Driver getRsvDinfo(String dNo) {
		return umpDao.getRsvDinfo(dNo);
	}

	@Override
	public int upRSVmsg(Reservation r) {
		return umpDao.upRSVmsg(r);
	}

	@Override
	public Reservation rDetail(String rNo) {
		return umpDao.rDetail(rNo);
	}


	@Override
	public Reservation pDetail(String rNo) {
		return umpDao.pDetail(rNo);
	}

	@Override
	public int rsvCan(Payment p) {
		return umpDao.rsvCan(p);
	}

	


}
