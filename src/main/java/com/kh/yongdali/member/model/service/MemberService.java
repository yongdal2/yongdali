package com.kh.yongdali.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.yongdali.member.model.vo.Member;

@Service
public interface MemberService {

	/**
	 * 1. 로그인
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);
	
	
}
