package com.kh.yongdali.myPage.model.service;

import com.kh.yongdali.driver.model.vo.Driver;

public interface DriverMyPageService {

	/**
	 * 프로필 이미지 수정
	 * @param d
	 * @return
	 */
	int updateProfileImg(Driver d);

}
