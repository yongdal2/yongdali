package com.kh.yongdali.chat.model.service;

import java.util.ArrayList;

import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.Room;

public interface ChatService {

	/**
	 * 채팅방 생성하기
	 * @param r
	 * @return
	 */
	int userCreateChat(Room r);

	/**
	 * 최근 채팅방 가져오기
	 * @param r
	 * @return
	 */
	Room selectNowRoom(Room r);

	/**
	 * 채팅 메시지 입력하기
	 * @param m
	 * @return
	 */
	int userInsertMessage(Message m);

	/**
	 * 이전에 생성한 방 있는지 확인
	 * @param r
	 * @return
	 */
	Room selectPreRoom(Room r);

	ArrayList<Message> selectPreMessage(String roomNo);

	ArrayList<Room> selectAdPreRoom(Room r);







}
