package com.kh.yongdali.chat.msg;

import java.sql.Date;
import java.util.Objects;

public class Message {
	private String id; //접속한 아이디
	private String roomName; //방이름(접속한 사람 이름으로 설정)
	private String msg; // 메시지 내용
	private String flag; // 구분
	private String receiveId; // 받는 사람
	private String roomNo; // 방번호
	private Date createDate; // 방생성날짜
	private Date sendDate; // 메시지 보낸 날짜
	private String connectYN; // 대화종료 yn
	
	
	// room> roomName
	// + roomNo
	// + date date
	// + connectYN 대화종료시 yn
	// 
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(String id, String roomName, String msg, String flag) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.msg = msg;
		this.flag = flag;
	}

	public Message(String id, String roomName, String msg, String flag, String receiveId) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.msg = msg;
		this.flag = flag;
		this.receiveId = receiveId;
	}
	
	

	public Message(String id, String roomName, String receiveId, String roomNo, Date createDate, String connectYN) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.receiveId = receiveId;
		this.roomNo = roomNo;
		this.createDate = createDate;
		this.connectYN = connectYN;
	}

	public Message(String id, String roomName, String msg, String flag, String receiveId, String roomNo,
			Date createDate, Date sendDate, String connectYN) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.msg = msg;
		this.flag = flag;
		this.receiveId = receiveId;
		this.roomNo = roomNo;
		this.createDate = createDate;
		this.sendDate = sendDate;
		this.connectYN = connectYN;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	
	
	
	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
	

	public String getConnectYN() {
		return connectYN;
	}

	public void setConnectYN(String connectYN) {
		this.connectYN = connectYN;
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
		return "Message [id=" + id + ", roomName=" + roomName + ", msg=" + msg + ", flag=" + flag + ", receiveId="
				+ receiveId + ", roomNo=" + roomNo + ", createDate=" + createDate + ", sendDate=" + sendDate
				+ ", connectYN=" + connectYN + "]";
	}

	
	

	
	
	
	
}
