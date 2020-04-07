package com.kh.yongdali.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private String rpNo;		// 예약&결제 기본키
	private String rpMNo;		// 멤버 외래키
	private String rpDNo;		// 기사 외래키
	
	
	
	private int capacity;		// 차량 정보(톤)
	private String type;		// 차량 옵션
	
	
	private String startAddr;	// 출발지
	private String endAddr;		// 도착지
	
	private int distance;		// 거리
	private String phone1;		// 상차 연락처
	private String phone2;		// 하차 연락처
	private String rightLoad;	// 바로 상차
	private String rightUnload;	// 바로 하차
	private Date startDate;		// 상차 날짜
	private Date endDate;		// 하차 날짜
	private String helpLoad;	// 상차 도움
	private String helpUnload;	// 하차 도움
	private String luggage;		// 이삿집
	
	private String msg;			// 전달 사항
	private int amount;			// 총 결제 금액
	
	
	private String payYN;		// 결제 유무
	private String dealYN;		// 거래 성사 유무
	private Date dealDate;		// 거래 성사 날짜
	private Date enrollDate;	// 예약 등록 날짜
	
	
	public Reservation() {
	}
	
	
	
	// 예약 데이터 삽입용
	public Reservation(String rpNo, String rpMNo, String rpDNo, int capacity, String type, String startAddr,
			String endAddr, int distance, String phone1, String phone2, String rightLoad, String rightUnload,
			Date startDate, Date endDate, String helpLoad, String helpUnload, String luggage, String msg, int amount,
			String payYN, String dealYN, Date dealDate) {
		super();
		this.rpNo = rpNo;
		this.rpMNo = rpMNo;
		this.rpDNo = rpDNo;
		this.capacity = capacity;
		this.type = type;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.distance = distance;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.rightLoad = rightLoad;
		this.rightUnload = rightUnload;
		this.startDate = startDate;
		this.endDate = endDate;
		this.helpLoad = helpLoad;
		this.helpUnload = helpUnload;
		this.luggage = luggage;
		this.msg = msg;
		this.amount = amount;
		this.payYN = payYN;
		this.dealYN = dealYN;
		this.dealDate = dealDate;
	}




	// 전체 출력용
	public Reservation(String rpNo, String rpMNo, String rpDNo, int capacity, String type, String startAddr,
			String endAddr, int distance, String phone1, String phone2, String rightLoad, String rightUnload,
			Date startDate, Date endDate, String helpLoad, String helpUnload, String luggage, String msg, int amount,
			String payYN, String dealYN, Date dealDate, Date enrollDate) {
		super();
		this.rpNo = rpNo;
		this.rpMNo = rpMNo;
		this.rpDNo = rpDNo;
		this.capacity = capacity;
		this.type = type;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.distance = distance;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.rightLoad = rightLoad;
		this.rightUnload = rightUnload;
		this.startDate = startDate;
		this.endDate = endDate;
		this.helpLoad = helpLoad;
		this.helpUnload = helpUnload;
		this.luggage = luggage;
		this.msg = msg;
		this.amount = amount;
		this.payYN = payYN;
		this.dealYN = dealYN;
		this.dealDate = dealDate;
		this.enrollDate = enrollDate;
	}

	public String getRpNo() {
		return rpNo;
	}

	public void setRpNo(String rpNo) {
		this.rpNo = rpNo;
	}

	public String getRpMNo() {
		return rpMNo;
	}

	public void setRpMNo(String rpMNo) {
		this.rpMNo = rpMNo;
	}

	public String getRpDNo() {
		return rpDNo;
	}

	public void setRpDNo(String rpDNo) {
		this.rpDNo = rpDNo;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStartAddr() {
		return startAddr;
	}

	public void setStartAddr(String startAddr) {
		this.startAddr = startAddr;
	}

	public String getEndAddr() {
		return endAddr;
	}

	public void setEndAddr(String endAddr) {
		this.endAddr = endAddr;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getRightLoad() {
		return rightLoad;
	}

	public void setRightLoad(String rightLoad) {
		this.rightLoad = rightLoad;
	}

	public String getRightUnload() {
		return rightUnload;
	}

	public void setRightUnload(String rightUnload) {
		this.rightUnload = rightUnload;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getHelpLoad() {
		return helpLoad;
	}

	public void setHelpLoad(String helpLoad) {
		this.helpLoad = helpLoad;
	}

	public String getHelpUnload() {
		return helpUnload;
	}

	public void setHelpUnload(String helpUnload) {
		this.helpUnload = helpUnload;
	}

	public String getLuggage() {
		return luggage;
	}

	public void setLuggage(String luggage) {
		this.luggage = luggage;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayYN() {
		return payYN;
	}

	public void setPayYN(String payYN) {
		this.payYN = payYN;
	}

	public String getDealYN() {
		return dealYN;
	}

	public void setDealYN(String dealYN) {
		this.dealYN = dealYN;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
}
