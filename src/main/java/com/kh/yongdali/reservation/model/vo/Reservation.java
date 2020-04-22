package com.kh.yongdali.reservation.model.vo;

import java.sql.Date;

/**
 * @author user2
 *
 */
public class Reservation {
	private String rNo;			// 예약&결제 기본키
	private String rMNo;		// 멤버 외래키
	private float capacity;	// 차량 정보(톤)
	private String type;		// 차량 옵션
	private String startName;	// 상차할 이름
	private String endName;	// 하차받을 이름
	private String startPhone;	// 상차 연락처
	private String endPhone;	// 하차 연락처
	private String startAddr;	// 출발지
	private String endAddr;		// 도착지
	private String distance;	// 거리
	private String rightLoad;	// 바로 상차
	private String rightUnload;	// 바로 하차
	private Date startDate;		// 상차 날짜
	private String startTime;	// 상차 시각
	private Date endDate;		// 하차 날짜
	private String endTime;		// 상차 시각
	private String helpLoad;	// 상차 도움
	private String helpUnload;	// 하차 도움
	private String luggage;		// 이삿집
	private String msg;			// 전달 사항
	private String amount;		// 총 결제 금액
	
	public Reservation() {}
	

	public Reservation(String rNo, String rMNo) {
		super();
		this.rNo = rNo;
		this.rMNo = rMNo;
	}

	public Reservation(String rNo, String rMNo, float capacity, String type, String startName, String endName,
			String startPhone, String endPhone, String startAddr, String endAddr, String distance, String rightLoad,
			String rightUnload, Date startDate, String startTime, Date endDate, String endTime, String helpLoad,
			String helpUnload, String luggage, String msg, String amount) {
		super();
		this.rNo = rNo;
		this.rMNo = rMNo;
		this.capacity = capacity;
		this.type = type;
		this.startName = startName;
		this.endName = endName;
		this.startPhone = startPhone;
		this.endPhone = endPhone;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.distance = distance;
		this.rightLoad = rightLoad;
		this.rightUnload = rightUnload;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.helpLoad = helpLoad;
		this.helpUnload = helpUnload;
		this.luggage = luggage;
		this.msg = msg;
		this.amount = amount;
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

	public String getStartName() {
		return startName;
	}

	public void setStartName(String startName) {
		this.startName = startName;
	}

	public String getEndName() {
		return endName;
	}

	public void setEndName(String endName) {
		this.endName = endName;
	}

	public String getStartPhone() {
		return startPhone;
	}

	public void setStartPhone(String startPhone) {
		this.startPhone = startPhone;
	}

	public String getEndPhone() {
		return endPhone;
	}

	public void setEndPhone(String endPhone) {
		this.endPhone = endPhone;
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

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	@Override
	public String toString() {
		return "Reservation [rNo=" + rNo + ", rMNo=" + rMNo + ", capacity=" + capacity + ", type=" + type
				+ ", startName=" + startName + ", endName=" + endName + ", startPhone=" + startPhone + ", endPhone="
				+ endPhone + ", startAddr=" + startAddr + ", endAddr=" + endAddr + ", distance=" + distance
				+ ", rightLoad=" + rightLoad + ", rightUnload=" + rightUnload + ", startDate=" + startDate
				+ ", startTime=" + startTime + ", endDate=" + endDate + ", endTime=" + endTime + ", helpLoad="
				+ helpLoad + ", helpUnload=" + helpUnload + ", luggage=" + luggage + ", msg=" + msg + ", amount="
				+ amount + "]";
	}
	
}


