package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import com.kh.yongdali.myPage.model.vo.Address;

/**
 * @author SH-Surface
 *
 */
public interface UserMyPageService {

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
	Address getUpAddr(String aNo);

	/**
	 * 주소록 수정
	 * @param a
	 * @return
	 */
	int updateAddr(Address a);

	/**
	 * 주소록 추가
	 * @param a
	 * @return
	 */
	int insertAddr(Address a);

	/**
	 * 주소록 삭제
	 * @param aNo
	 * @return
	 */
	int deleteAddr(String aNo); 
}
