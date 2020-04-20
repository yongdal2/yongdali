package com.kh.yongdali.chat.msg;

import java.util.Objects;

public class Message {
	private String id;
	private String room;
	private String msg;
	private String flag;
	private String receiveId;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(String id, String room, String msg, String flag) {
		super();
		this.id = id;
		this.room = room;
		this.msg = msg;
		this.flag = flag;
	}

	public Message(String id, String room, String msg, String flag, String receiveId) {
		super();
		this.id = id;
		this.room = room;
		this.msg = msg;
		this.flag = flag;
		this.receiveId = receiveId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof Message) {
			Message m=(Message)obj;
			return this.id.equals(m.getId());
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	

	@Override
	public String toString() {
		return "Message [id=" + id + ", room=" + room + ", msg=" + msg + ", flag=" + flag + ", receiveId=" + receiveId
				+ "]";
	}
	
	
	
}
