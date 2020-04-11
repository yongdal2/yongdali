package com.kh.yongdali.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertSampleMembers(ArrayList<Member> mList) {
		return sqlSession.insert("memberMapper.insertSampleMembers", mList);
	}

	public int emailChk(String mId) {
		return sqlSession.selectOne("mamberMapper.emailChk", mId);
	}
	
}
