package com.kh.yongdali.chat.msg;

import java.sql.Date;

public class Room {
	private String id; //접속한 아이디
	private String roomName; //방이름(접속한 사람 이름으로 설정)
	private String msg; // 메시지 내용
	private String flag; // 구분
	private String receiveId; // 받는 사람
	private String roomNo; // 방번호
	private String msgNo; // 메시지번호
	private Date createDate; // 방생성날짜
	private Date sendDate; // 메시지 보낸 날짜
	private String connectYN; // 대화종료 yn
	
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Room(String id, String roomName, String msg, String flag, String receiveId, String roomNo, String msgNo,
			Date createDate, Date sendDate, String connectYN) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.msg = msg;
		this.flag = flag;
		this.receiveId = receiveId;
		this.roomNo = roomNo;
		this.msgNo = msgNo;
		this.createDate = createDate;
		this.sendDate = sendDate;
		this.connectYN = connectYN;
	}
	
	

	public Room(String id, String roomName, String flag, String receiveId, String roomNo, Date createDate,
			String connectYN) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.flag = flag;
		this.receiveId = receiveId;
		this.roomNo = roomNo;
		this.createDate = createDate;
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

	public String getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(String msgNo) {
		this.msgNo = msgNo;
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
	public String toString() {
		return "Room [id=" + id + ", roomName=" + roomName + ", msg=" + msg + ", flag=" + flag + ", receiveId="
				+ receiveId + ", roomNo=" + roomNo + ", msgNo=" + msgNo + ", createDate=" + createDate + ", sendDate="
				+ sendDate + ", connectYN=" + connectYN + "]";
	}
	
	
	
	
}
