package com.kh.yongdali.admin.model.vo;

import java.sql.Date;

public class RefSearchCondition {
	
	private String mNo;
	private String rNo;
	private String email;
	private String mName;
	private String phone;
	private String cancAmount;
	private String calcYn;
	private String content;
	private Date calcDate;

	
	
	
	public RefSearchCondition() {
		super();
	}




	public RefSearchCondition(String mNo, String rNo, String email, String mName, String phone, String cancAmount,
			String calcYn, String content, Date calcDate) {
		super();
		this.mNo = mNo;
		this.rNo = rNo;
		this.email = email;
		this.mName = mName;
		this.phone = phone;
		this.cancAmount = cancAmount;
		this.calcYn = calcYn;
		this.content = content;
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




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public Date getCalcDate() {
		return calcDate;
	}




	public void setCalcDate(Date calcDate) {
		this.calcDate = calcDate;
	}




	@Override
	public String toString() {
		return "RefSearchCondition [mNo=" + mNo + ", rNo=" + rNo + ", email=" + email + ", mName=" + mName + ", phone="
				+ phone + ", cancAmount=" + cancAmount + ", calcYn=" + calcYn + ", content=" + content + ", calcDate="
				+ calcDate + "]";
	}

	
	
	
	
}
