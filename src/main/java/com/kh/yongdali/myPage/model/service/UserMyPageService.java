package com.kh.yongdali.myPage.model.service;

import java.util.ArrayList;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.payment.model.vo.Payment;
import com.kh.yongdali.reservation.model.vo.Reservation;

/**
 * @author SH-Surface
 *
 */
public interface UserMyPageService {

	/**
	 * 유저 폰번호 수정
	 * @param m
	 * @return
	 */
	int updatePhone(Member m);
	
	/**광고 동의
	 * @param loginUser
	 * @return
	 */
	int pushUpdate(Member m);
	
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
	 * @param a기
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


	/**
	 * 마이페이지 예약목록 카운트
	 * @param f
	 * @return
	 */
	int getRsvListCount(Filter f);


	/** 마이페이지 예약내역
	 * @param pi
	 * @param f
	 * @return
	 */
	ArrayList<Reservation> selectRsvList(PageInfo pi, Filter f);


	/**
	 * 기사정보 불러오기
	 * @param dNo
	 * @return
	 */
	Driver getRsvDinfo(String dNo);


	/**
	 * 예약 메세지 업데이트
	 * @param rMsg
	 * @param rNo
	 * @return
	 */
	int upRSVmsg(Reservation r);


	/**예약페이지 상세보기
	 * @param rNo
	 * @return
	 */
	Reservation rDetail(String rNo);


	/**payment 정보 불러오기
	 * @param rNo
	 * @return
	 */

	Reservation pDetail(String rNo);


	/**
	 * 예약취소
	 * @return
	 */
	int rsvCan(Payment p);

	/**
	 * 주소록 사용날짜 업데이트
	 * @param aNo
	 * @return
	 */
	int addrSys(String aNo);

	/**
	 * 비밀번호 업데이트
	 * @param m
	 * @return
	 */
	int uPwd(Member m);
	

	


}
