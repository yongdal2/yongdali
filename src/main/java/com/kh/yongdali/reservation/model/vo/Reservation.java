package com.kh.yongdali.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private String rpNo;
	private String rpMNo;
	private String rpDNo;
	private int capacity;
	private String type;
	private String startAddr;
	private String endAddr;
	private int distance;
	private String phone1;
	private String phone2;
	private String rightLoadYN;
	private String rightUnloadYN;
	private Date loadDate;
	private Date unloadDate;
	private String loadHpYN;
	private String unloadHpYN;
	private String luggage;
	private String msg;
	private int amount;
	private String payYN;
	private String dealYN;
	private Date dealDate;
	private Date enrollDate;
	public Reservation() {}
	
	// 예약용
	public Reservation(String rpNo, String rpMNo, String rpDNo, int capacity, String type, String startAddr,
			String endAddr, int distance, String phone1, String phone2, String rightLoadYN, String rightUnloadYN,
			Date loadDate, Date unloadDate, String loadHpYN, String unloadHpYN, String luggage, String msg, int amount,
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
		this.rightLoadYN = rightLoadYN;
		this.rightUnloadYN = rightUnloadYN;
		this.loadDate = loadDate;
		this.unloadDate = unloadDate;
		this.loadHpYN = loadHpYN;
		this.unloadHpYN = unloadHpYN;
		this.luggage = luggage;
		this.msg = msg;
		this.amount = amount;
		this.payYN = payYN;
		this.dealYN = dealYN;
		this.dealDate = dealDate;
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
	public String getRightLoadYN() {
		return rightLoadYN;
	}
	public void setRightLoadYN(String rightLoadYN) {
		this.rightLoadYN = rightLoadYN;
	}
	public String getRightUnloadYN() {
		return rightUnloadYN;
	}
	public void setRightUnloadYN(String rightUnloadYN) {
		this.rightUnloadYN = rightUnloadYN;
	}
	public Date getLoadDate() {
		return loadDate;
	}
	public void setLoadDate(Date loadDate) {
		this.loadDate = loadDate;
	}
	public Date getUnloadDate() {
		return unloadDate;
	}
	public void setUnloadDate(Date unloadDate) {
		this.unloadDate = unloadDate;
	}
	public String getLoadHpYN() {
		return loadHpYN;
	}
	public void setLoadHpYN(String loadHpYN) {
		this.loadHpYN = loadHpYN;
	}
	public String getUnloadHpYN() {
		return unloadHpYN;
	}
	public void setUnloadHpYN(String unloadHpYN) {
		this.unloadHpYN = unloadHpYN;
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
		return "Reservation [rpNo=" + rpNo + ", rpMNo=" + rpMNo + ", rpDNo=" + rpDNo + ", capacity=" + capacity
				+ ", type=" + type + ", startAddr=" + startAddr + ", endAddr=" + endAddr + ", distance=" + distance
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", rightLoadYN=" + rightLoadYN + ", rightUnloadYN="
				+ rightUnloadYN + ", loadDate=" + loadDate + ", unloadDate=" + unloadDate + ", loadHpYN=" + loadHpYN
				+ ", unloadHpYN=" + unloadHpYN + ", luggage=" + luggage + ", msg=" + msg + ", amount=" + amount
				+ ", payYN=" + payYN + ", dealYN=" + dealYN + ", dealDate=" + dealDate + "]";
	}
	
	
}
