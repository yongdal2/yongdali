package com.kh.yongdali.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.dao.MemberDao;
import com.kh.yongdali.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}

	@Override
	public int insertSampleMembers(ArrayList<Member> mList) {
		return mDao.insertSampleMembers(mList);
	}

	@Override
	public int emailChk(String mId) {
		return mDao.emailChk(mId);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int insertDriver(Driver d) {
		return mDao.insertDriver(d);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(m);
	}
}
