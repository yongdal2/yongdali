package com.kh.yongdali.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Repository("dmpDao")
public class DriverMyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateProfileImg(Driver d) {
		return sqlSession.update("myPageMapper.updateProfileImg",d);
	}

	public Driver truckInfoView(String mNo) {
		return sqlSession.selectOne("myPageMapper.truckInfoView",mNo);
	}

	public int getCalListCount(Filter f) {
		return sqlSession.selectOne("myPageMapper.getListCount",f);
	}

	public ArrayList<Reservation> selectCalList(PageInfo pi, Filter f) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.seLectList", f, rowBounds);
	}

	
	
	

}
