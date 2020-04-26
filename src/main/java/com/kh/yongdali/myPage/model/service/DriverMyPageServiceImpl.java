package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.myPage.model.dao.DriverMyPageDao;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Service("dmpService")
public class DriverMyPageServiceImpl implements DriverMyPageService {
	@Autowired
	private DriverMyPageDao dmpDao;

	@Override
	public int updateProfileImg(Driver d) {
		return dmpDao.updateProfileImg(d);
	}

	@Override
	public Driver truckInfoView(String mNo) {
		return dmpDao.truckInfoView(mNo);
	}

	@Override
	public int getCalListCount(String dNo) {
		return dmpDao.getCalListCount(dNo);
	}

	@Override
	public ArrayList<Reservation> selectCalList(PageInfo pi, String dNo) {
		return dmpDao.selectCalList(pi, dNo);
	}

}
