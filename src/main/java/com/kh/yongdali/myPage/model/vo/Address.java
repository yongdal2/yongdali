package com.kh.yongdali.myPage.model.vo;

import java.sql.Date;

public class Address {
	
	private String aNo;
	private String aMno;
	private String aPlace;
	private String aName;
	private String aAddress;
	private String aPhone;
	private Date aRecentDate;
	
	public Address() {
		super();
	}

	public Address(String aNo, String aMno, String aPlace, String aName, String aAddress, String aPhone,
			Date aRecentDate) {
		super();
		this.aNo = aNo;
		this.aMno = aMno;
		this.aPlace = aPlace;
		this.aName = aName;
		this.aAddress = aAddress;
		this.aPhone = aPhone;
		this.aRecentDate = aRecentDate;
	}

	public String getaNo() {
		return aNo;
	}

	public void setaNo(String aNo) {
		this.aNo = aNo;
	}

	public String getaMno() {
		return aMno;
	}

	public void setaMno(String aMno) {
		this.aMno = aMno;
	}

	public String getaPlace() {
		return aPlace;
	}

	public void setaPlace(String aPlace) {
		this.aPlace = aPlace;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaAddress() {
		return aAddress;
	}

	public void setaAddress(String aAddress) {
		this.aAddress = aAddress;
	}

	public String getaPhone() {
		return aPhone;
	}

	public void setaPhone(String aPhone) {
		this.aPhone = aPhone;
	}

	public Date getaRecentDate() {
		return aRecentDate;
	}

	public void setaRecentDate(Date aRecentDate) {
		this.aRecentDate = aRecentDate;
	}

	@Override
	public String toString() {
		return "Address [aNo=" + aNo + ", aMno=" + aMno + ", aPlace=" + aPlace + ", aName=" + aName + ", aAddress="
				+ aAddress + ", aPhone=" + aPhone + ", aRecentDate=" + aRecentDate + "]";
	}


}

