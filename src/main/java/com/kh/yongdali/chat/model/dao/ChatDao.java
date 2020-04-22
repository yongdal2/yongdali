package com.kh.yongdali.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.chat.msg.Message;

@Repository("cDao")
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int userInsertChat(Message m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.userInsertChat",m);
	}

	public int userCreateChat(Message m) {
		
		return sqlSession.insert("chatMapper.userCreateChat", m);
	}

}
