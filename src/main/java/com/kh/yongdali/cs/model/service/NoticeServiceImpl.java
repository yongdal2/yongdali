package com.kh.yongdali.cs.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.cs.model.dao.NoticeDao;
import com.kh.yongdali.cs.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nDao;
	
	
	@Override
	public int userGetListCount() {
		
		return nDao.userGetListCount();
	}
	@Override
	public ArrayList<Notice> userSelectList(PageInfo pi) {
		
		return nDao.userSelectList(pi);
	}
	@Override
	public Notice userSelectNoticeDetail(String nNo) {
		
		return nDao.userSelectNoticeDetail(nNo);
	}
	@Override
	public Notice userSelectPreList(String nNo) {
		
		return nDao.userSelectPreList(nNo);
	}
	@Override
	public Notice userSelectNextList(String nNo) {
		
		return nDao.userSelectNextList(nNo);
	}
	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(n);
	}
	@Override
	public Notice selectUpdateNotice(String nNo) {
		
		return nDao.userSelectNoticeDetail(nNo);
	}
	@Override
	public int updateNotice(Notice n) {
		
		return nDao.updateNotice(n);
	}
	@Override
	public int deleteNotice(String nNo) {
		
		return nDao.deleteNotice(nNo);
	}
	@Override
	public int userSearchGetListCount(String keyword) {
		
		return nDao.userSearchGetListCount(keyword);
	}
	@Override
	public ArrayList<Notice> userSearchSelectList(PageInfo pi,String keyword) {
		
		return nDao.userSearchSelectList(pi,keyword);
	}
}
