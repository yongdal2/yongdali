package com.kh.yongdali.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.yongdali.member.model.vo.Member;

@Service
public interface MemberService {

	/**
	 * 샘플데이터 삽입
	 * @param mList
	 * @return
	 */
	int insertSampleMembers(ArrayList<Member> mList);
	
	/**
	 * 로그인
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);

	/**
	 * 이메일 중복검사
	 * @return
	 */
	int emailChk(String mId);

	/**
	 * 회원가입(일반)
	 * @param m
	 * @return
	 */
	int insertMember(Member m);


	
	
}
