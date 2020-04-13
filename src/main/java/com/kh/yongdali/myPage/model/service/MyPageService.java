package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import com.kh.yongdali.myPage.model.vo.Address;

public interface MyPageService {

	/**
	 * 나의 주소록 갯수 조회
	 * @param mId 
	 */
	int getAddrListCount(String mNo);

	/**
	 * 주소록 리스트 조회
	 * @param mId
	 * @return
	 */
	ArrayList<Address> selectAddrList(String mNo);

	/**
	 * 수정할 주소 조회
	 * @param aNo
	 * @return
	 */
	Address getEditAddr(String aNo);

}
