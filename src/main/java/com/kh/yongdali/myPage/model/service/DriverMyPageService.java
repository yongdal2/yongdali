package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.reservation.model.vo.Reservation;

public interface DriverMyPageService {

	/**
	 * 프로필 이미지 수정
	 * @param d
	 * @return
	 */
	int updateProfileImg(Driver d);

	/**
	 * 차량정보
	 * @param mNo
	 * @return
	 */
	Driver truckInfoView(String mNo);

	/**
	 * 정산 listCount
	 * @param f
	 * @return
	 */
	int getCalListCount(Filter f);

	/**
	 * 유저 정산내역
	 * @param pi
	 * @param f
	 * @return
	 */
	ArrayList<Reservation> selectCalList(PageInfo pi, Filter f);

}
