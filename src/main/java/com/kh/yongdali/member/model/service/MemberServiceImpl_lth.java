package com.kh.yongdali.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.Notice;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.member.model.dao.MemberDao_lth;

@Service("mServiceL")
public class MemberServiceImpl_lth implements MemberService_lth {

	@Autowired
	private MemberDao_lth mDaoL;
	@Override
	public int getListCount() {
		
		return mDaoL.getListCount();
	}
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return mDaoL.selectList(pi);
	}
	@Override
	public Notice selectNoticeDetail(String nNo) {
		
		return mDaoL.selectNoticeDatail(nNo);
	}
	@Override
	public Notice selectPreList(String nNo) {
		
		return mDaoL.selectPreList(nNo);
	}
	@Override
	public Notice selectNextList(String nNo) {
		
		return mDaoL.selectNextList(nNo);
	}
	
}
