package com.kh.yongdali.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yongdali.chat.model.dao.ChatDao;
import com.kh.yongdali.chat.msg.Message;

@Service("cService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao cDao;

	@Override
	public int userInsertChat(Message m) {
		
		return cDao.userInsertChat(m);
	}

	@Override
	public int userCreateChat(Message m) {
		
		return cDao.userCreateChat(m);
	}

}
