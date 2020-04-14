package com.kh.yongdali.reservation.model.vo;

import java.util.Date;

public class Reservation {
	private String rNo;			// 예약&결제 기본키
	private String rMNo;		// 멤버 외래키
	private String rDNo;		// 기사 외래키
	private float capacity;	// 차량 정보(톤)
	private String type;		// 차량 옵션
	private String start_name;	// 상차할 이름
	private String end_name;	// 하차받을 이름
	private String start_phone;	// 상차 연락처
	private String end_phone;	// 하차 연락처
	private String startAddr;	// 출발지
	private String endAddr;		// 도착지
	private String distance;	// 거리
	private String rightLoad;	// 바로 상차
	private String rightUnload;	// 바로 하차
	private Date startDate;		// 상차 날짜
	private String startTime;	// 상차 시각
	private Date endDate;		// 하차 날짜
	private String endTime;	// 상차 시각
	private String helpLoad;	// 상차 도움
	private String helpUnload;	// 하차 도움
	private String luggage;		// 이삿집
	private String msg;			// 전달 사항
	private String amount;		// 총 결제 금액
	private String payYN;		// 결제 유무
	private String dealYN;		// 거래 성사 유무
	private Date dealDate;		// 거래 성사 날짜
	private String calcYN;		// 정산 유무
	private Date calcDate;		// 정산 날짜
	private Date enrollDate;	// 예약 등록 날짜
	
	public Reservation() {}

	
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

	public float getCapacity() {
		return capacity;
	}

	public void setCapacity(float capacity) {
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

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getStart_name() {
		return start_name;
	}


	public void setStart_name(String start_name) {
		this.start_name = start_name;
	}


	public String getEnd_name() {
		return end_name;
	}


	public void setEnd_name(String end_name) {
		this.end_name = end_name;
	}


	public String getStart_phone() {
		return start_phone;
	}


	public void setStart_phone(String start_phone) {
		this.start_phone = start_phone;
	}


	public String getEnd_phone() {
		return end_phone;
	}


	public void setEnd_phone(String end_phone) {
		this.end_phone = end_phone;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
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
	
	public String getCalcYN() {
		return calcYN;
	}

	public void setCalcYN(String calcYN) {
		this.calcYN = calcYN;
	}

	public Date getCalcDate() {
		return calcDate;
	}

	public void setCalcDate(Date calcDate) {
		this.calcDate = calcDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	
}


