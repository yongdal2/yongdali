package com.kh.yongdali.admin.model.vo;

import java.sql.Date;

public class adRefund {

	private String mNo;
	private String rNo;
	private String email;
	private String mName;
	private String phone;
	private String cancAmount;
	private String calcYn;
	private Date calcDate;
	public adRefund() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adRefund(String mNo, String rNo, String email, String mName, String phone, String cancAmount, String calcYn,
			Date calcDate) {
		super();
		this.mNo = mNo;
		this.rNo = rNo;
		this.email = email;
		this.mName = mName;
		this.phone = phone;
		this.cancAmount = cancAmount;
		this.calcYn = calcYn;
		this.calcDate = calcDate;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getrNo() {
		return rNo;
	}
	public void setrNo(String rNo) {
		this.rNo = rNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCancAmount() {
		return cancAmount;
	}
	public void setCancAmount(String cancAmount) {
		this.cancAmount = cancAmount;
	}
	public String getCalcYn() {
		return calcYn;
	}
	public void setCalcYn(String calcYn) {
		this.calcYn = calcYn;
	}
	public Date getCalcDate() {
		return calcDate;
	}
	public void setCalcDate(Date calcDate) {
		this.calcDate = calcDate;
	}
	@Override
	public String toString() {
		return "adRefund [mNo=" + mNo + ", rNo=" + rNo + ", email=" + email + ", mName=" + mName + ", phone=" + phone
				+ ", cancAmount=" + cancAmount + ", calcYn=" + calcYn + ", calcDate=" + calcDate + "]";
	}
	
	
	
	
	
}