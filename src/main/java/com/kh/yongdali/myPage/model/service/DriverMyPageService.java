package com.kh.yongdali.myPage.model.service;

import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;

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

}
