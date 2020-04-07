package com.kh.yongdali.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member {

	private String mId;
	private String pwd;
	private String mName;
	private String phone;
	private String mSort;
	private String mStatus;
	private Date enrollDate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String mId, String pwd, String mName, String phone, String mSort, String mStatus, Date enrollDate) {
		super();
		this.mId = mId;
		this.pwd = pwd;
		this.mName = mName;
		this.phone = phone;
		this.mSort = mSort;
		this.mStatus = mStatus;
		this.enrollDate = enrollDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getmSort() {
		return mSort;
	}

	public void setmSort(String mSort) {
		this.mSort = mSort;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", pwd=" + pwd + ", mName=" + mName + ", phone=" + phone + ", mSort=" + mSort
				+ ", mStatus=" + mStatus + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
}
