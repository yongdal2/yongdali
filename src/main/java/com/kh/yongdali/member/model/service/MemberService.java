package com.kh.yongdali.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.yongdali.member.model.vo.Member;

@Service
public interface MemberService {

	/**
	 * 샘플데이터 삽
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


	
	
}
