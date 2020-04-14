//AdminService를 interface로 만들고 Impl파일을 add해서 Matching
package com.kh.yongdali.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.admin.model.dao.AdminDao;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.common.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao aDao;

	@Override
	public int getMemListCount() {
		return aDao.getMemListCount();
		
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return aDao.selectList(pi);
	}

}