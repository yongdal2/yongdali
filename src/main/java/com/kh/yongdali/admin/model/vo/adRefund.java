package com.kh.yongdali.admin.model.vo;

public class adRefund {

	private String mNo;
	private String rNo;
	private String email;
	private String mName;
	private String phone;
	private String cancAmount;
	private String calcYn;
	

	
	public adRefund() {
		super();
	}


	public adRefund(String mNo, String rNo, String email, String mName, String phone, String cancAmount,
			String calcYn) {
		super();
		this.mNo = mNo;
		this.rNo = rNo;
		this.email = email;
		this.mName = mName;
		this.phone = phone;
		this.cancAmount = cancAmount;
		this.calcYn = calcYn;
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


	public String getcalcYn() {
		return calcYn;
	}


	public void setcalcYn(String calcYn) {
		this.calcYn = calcYn;
	}


	@Override
	public String toString() {
		return "adRefund [mNo=" + mNo + ", rNo=" + rNo + ", email=" + email + ", mName=" + mName + ", phone=" + phone
				+ ", cancAmount=" + cancAmount + ", calcYn=" + calcYn + "]";
	}
	
	
	
	
	
}
