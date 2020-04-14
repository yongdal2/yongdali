package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.myPage.model.dao.MyPageDao;
import com.kh.yongdali.myPage.model.vo.Address;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao mpDao;

	@Override
	public int getAddrListCount(String mNo) {
		return mpDao.getAddrListCount(mNo);
	}

	@Override
	public ArrayList<Address> selectAddrList(String mNo) {
		return mpDao.selectAddrList(mNo);
	}

	@Override
	public Address getEditAddr(String aNo) {
		return mpDao.getEditAddr(aNo);
	}

}
