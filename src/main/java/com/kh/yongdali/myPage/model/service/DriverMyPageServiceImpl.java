package com.kh.yongdali.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.myPage.model.dao.DriverMyPageDao;

@Service("dmpService")
public class DriverMyPageServiceImpl implements DriverMyPageService {
	@Autowired
	private DriverMyPageDao dmpDao;

	@Override
	public int updateProfileImg(Driver d) {
		return dmpDao.updateProfileImg(d);
	}

}
