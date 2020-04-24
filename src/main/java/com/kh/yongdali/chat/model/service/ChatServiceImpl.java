package com.kh.yongdali.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.chat.model.dao.ChatDao;
import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.Room;

@Service("cService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao cDao;


	@Override
	public int userCreateChat(Room r) {
		
		return cDao.userCreateChat(r);
	}

	@Override
	public Room selectNowRoom(Room r) {
		
		return cDao.selectNowRoom(r);
	}

	@Override
	public int userInsertMessage(Message m) {
		
		return cDao.userInsertMessage(m);
	}

}
