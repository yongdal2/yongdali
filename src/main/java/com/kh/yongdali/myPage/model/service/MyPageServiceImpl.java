package com.kh.yongdali.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.myPage.model.dao.MyPageDao;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao mpDao;

	@Override
	public int getAddrListCount() {
		return mpDao.getAddrListCount();
	}

}
