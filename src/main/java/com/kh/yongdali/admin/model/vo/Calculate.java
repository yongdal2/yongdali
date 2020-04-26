package com.kh.yongdali.admin.model.vo;

import java.sql.Date;

public class Calculate {
	private String cNo;
	private String cPNo;
	private int fee;
	private String cDNo;
	private int charge;
	private String calcYN;
	private Date calcDate;
	
	
	public Calculate() {}


	public Calculate(String cNo, String cPNo, int fee, String cDNo, int charge, String calcYN, Date calcDate) {
		this.cNo = cNo;
		this.cPNo = cPNo;
		this.fee = fee;
		this.cDNo = cDNo;
		this.charge = charge;
		this.calcYN = calcYN;
		this.calcDate = calcDate;
	}


	public String getcNo() {
		return cNo;
	}


	public void setcNo(String cNo) {
		this.cNo = cNo;
	}


	public String getcPNo() {
		return cPNo;
	}


	public void setcPNo(String cPNo) {
		this.cPNo = cPNo;
	}


	public int getFee() {
		return fee;
	}


	public void setFee(int fee) {
		this.fee = fee;
	}


	public String getcDNo() {
		return cDNo;
	}


	public void setcDNo(String cDNo) {
		this.cDNo = cDNo;
	}


	public int getCharge() {
		return charge;
	}


	public void setCharge(int charge) {
		this.charge = charge;
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


	@Override
	public String toString() {
		return "Calculate [cNo=" + cNo + ", cPNo=" + cPNo + ", fee=" + fee + ", cDNo=" + cDNo + ", charge=" + charge
				+ ", calcYN=" + calcYN + ", calcDate=" + calcDate + "]";
	}
	
	
}
