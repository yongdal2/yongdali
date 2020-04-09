package com.kh.yongdali.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private String rNo;			// 1예약&결제 기본키
	private String rMNo;		// 2멤버 외래키
	private String rDNo;		// 3기사 외래키
	
	
	
	private int capacity;		// 4차량 정보(톤)
	private String type;		// 5차량 옵션
	
	
	private String startAddr;	// 6출발지
	private String endAddr;		// 7도착지
	
	private int distance;		// 8거리
	private String phone1;		// 9상차 연락처
	private String phone2;		// 0하차 연락처
	private String rightLoad;	// 1바로 상차
	private String rightUnload;	// 2바로 하차
	private Date startDate;		// 3상차 날짜
	private Date endDate;		// 4하차 날짜
	private String helpLoad;	// 5상차 도움
	private String helpUnload;	// 6하차 도움
	private String luggage;		// 7이삿집
	
	private String msg;			// 8전달 사항
	private int amount;			// 9총 결제 금액
	
	
	private String payYN;		// 0결제 유무
	private String dealYN;		// 1거래 성사 유무
	private Date dealDate;		// 2거래 성사 날짜
	private Date enrollDate;	// 3예약 등록 날짜
	
	public Reservation() {}
	
	
	// 회원가입용
	public Reservation(String rNo, String rMNo, String rDNo, int capacity, String type, String startAddr,
			String endAddr, int distance, String phone1, String phone2, String rightLoad, String rightUnload,
			Date startDate, Date endDate, String helpLoad, String helpUnload, String luggage, String msg, int amount,
			String payYN, String dealYN, Date dealDate, Date enrollDate) {
		super();
		this.rNo = rNo;
		this.rMNo = rMNo;
		this.rDNo = rDNo;
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
	public String getrNo() {
		return rNo;
	}
	public void setrNo(String rNo) {
		this.rNo = rNo;
	}
	public String getrMNo() {
		return rMNo;
	}
	public void setrMNo(String rMNo) {
		this.rMNo = rMNo;
	}
	public String getrDNo() {
		return rDNo;
	}
	public void setrDNo(String rDNo) {
		this.rDNo = rDNo;
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
	@Override
	public String toString() {
		return "Reservation [rNo=" + rNo + ", rMNo=" + rMNo + ", rDNo=" + rDNo + ", capacity=" + capacity + ", type="
				+ type + ", startAddr=" + startAddr + ", endAddr=" + endAddr + ", distance=" + distance + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", rightLoad=" + rightLoad + ", rightUnload=" + rightUnload
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", helpLoad=" + helpLoad + ", helpUnload="
				+ helpUnload + ", luggage=" + luggage + ", msg=" + msg + ", amount=" + amount + ", payYN=" + payYN
				+ ", dealYN=" + dealYN + ", dealDate=" + dealDate + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
	
}


