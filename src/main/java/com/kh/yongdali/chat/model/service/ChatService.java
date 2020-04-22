package com.kh.yongdali.chat.model.service;

import com.kh.yongdali.chat.msg.Message;

public interface ChatService {

	int userInsertChat(Message m);

	int userCreateChat(Message m);

}
