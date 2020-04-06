package com.kh.yongdali.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.notice.model.dao.NoticeDao;
import com.kh.yongdali.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nDao;
	@Override
	public int getListCount() {
		
		return nDao.getListCount();
	}
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return nDao.selectList(pi);
	}
	@Override
	public Notice selectNoticeDetail(String nNo) {
		
		return nDao.selectNoticeDatail(nNo);
	}
	@Override
	public Notice selectPreList(String nNo) {
		
		return nDao.selectPreList(nNo);
	}
	@Override
	public Notice selectNextList(String nNo) {
		
		return nDao.selectNextList(nNo);
	}
}
