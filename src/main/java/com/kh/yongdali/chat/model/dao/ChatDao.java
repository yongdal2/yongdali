package com.kh.yongdali.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.Room;

@Repository("cDao")
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int userCreateChat(Room r) {
		
		return sqlSession.insert("chatMapper.userCreateChat", r);
	}

	public Room selectNowRoom(Room r) {
		
		return sqlSession.selectOne("chatMapper.selectNowRoom",r);
	}

	public int userInsertMessage(Message m) {
		
		return sqlSession.insert("chatMapper.userInsertMessage",m);
	}

	public Room selectPreRoom(Room r) {
	
		return sqlSession.selectOne("chatMapper.selectPreRoom",r);
	}

	public ArrayList<Message> selectPreMessage(String roomNo) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectPreMessage", roomNo);
	}

	public ArrayList<Room> selectAdPreRoom(Room r) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectAdPreRoom", r);
	}





}
