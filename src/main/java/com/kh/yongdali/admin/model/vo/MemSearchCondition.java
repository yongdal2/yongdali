package com.kh.yongdali.admin.model.vo;

import java.sql.Date;

public class MemSearchCondition {

	private String mNo;
	private String mId; // email 
	private String pwd;
	private String mName;
	private String phone;
	private String mSort;
	private String mStatus;
	private String signupType;
	private String pushEnabled;
	private String content; 
	private Date enrollDate;
	
	
	public MemSearchCondition() {
		super();
	}


	public MemSearchCondition(String mNo, String mId, String pwd, String mName, String phone, String mSort, String mStatus,
			String signupType, String pushEnabled, String content, Date enrollDate) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.pwd = pwd;
		this.mName = mName;
		this.phone = phone;
		this.mSort = mSort;
		this.mStatus = mStatus;
		this.signupType = signupType;
		this.pushEnabled = pushEnabled;
		this.content = content;
		this.enrollDate = enrollDate;
	}


	public String getmNo() {
		return mNo;
	}


	public void setmNo(String mNo) {
		this.mNo = mNo;
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


	public String getSignupType() {
		return signupType;
	}


	public void setSignupType(String signupType) {
		this.signupType = signupType;
	}


	public String getPushEnabled() {
		return pushEnabled;
	}


	public void setPushEnabled(String pushEnabled) {
		this.pushEnabled = pushEnabled;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	@Override
	public String toString() {
		return "SearchCondition [mNo=" + mNo + ", mId=" + mId + ", pwd=" + pwd + ", mName=" + mName + ", phone=" + phone
				+ ", mSort=" + mSort + ", mStatus=" + mStatus + ", signupType=" + signupType + ", pushEnabled="
				+ pushEnabled + ", content=" + content + ", enrollDate=" + enrollDate + "]";
	}


	
	
	
}
