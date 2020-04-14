//member.vo.Member.java로 대체 

package com.kh.yongdali.admin.model.vo;

import java.sql.Date;

public class Admin_Mem {
	
	private String mNo;
	private String mId;
	private String pwd;
	private String name;
	private String phone;
	private String mSort;
	private String mStatus;
	private String pushEnabled;
	private Date enrollDate;
	
	
	public Admin_Mem() {
		
	}

//전제
	public Admin_Mem(String mNo, String mId, String pwd, String name, String phone, String mSort, String mStatus,
			String pushEnabled, Date enrollDate) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.mSort = mSort;
		this.mStatus = mStatus;
		this.pushEnabled = pushEnabled;
		this.enrollDate = enrollDate;
	}

//-pwd	
	public Admin_Mem(String mNo, String mId, String name, String phone, String mSort, String mStatus,
			String pushEnabled, Date enrollDate) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.name = name;
		this.phone = phone;
		this.mSort = mSort;
		this.mStatus = mStatus;
		this.pushEnabled = pushEnabled;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPushEnabled() {
		return pushEnabled;
	}

	public void setPushEnabled(String pushEnabled) {
		this.pushEnabled = pushEnabled;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Admin_Mem [mNo=" + mNo + ", mId=" + mId + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone
				+ ", mSort=" + mSort + ", mStatus=" + mStatus + ", pushEnabled=" + pushEnabled + ", enrollDate="
				+ enrollDate + "]";
	}

	
	
	
	
}
