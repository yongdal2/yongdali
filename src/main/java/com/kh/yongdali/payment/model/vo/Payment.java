package com.kh.yongdali.payment.model.vo;

import java.sql.Date;

public class Payment {
	private String pNo;
	private String pRNo;
	private String pDNo;
	private String dealYN;
	private Date dealDate;
	private String cancYN;
	private Date cancDate;
	private String payYN;
	private Date enrollDate;
	
	public Payment() {}

	public Payment(String pNo, String pRNo, String pDNo, String dealYN, Date dealDate, String cancYN, Date cancDate,
			String payYN, Date enrollDate) {
		super();
		this.pNo = pNo;
		this.pRNo = pRNo;
		this.pDNo = pDNo;
		this.dealYN = dealYN;
		this.dealDate = dealDate;
		this.cancYN = cancYN;
		this.cancDate = cancDate;
		this.payYN = payYN;
		this.enrollDate = enrollDate;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public String getpRNo() {
		return pRNo;
	}

	public void setpRNo(String pRNo) {
		this.pRNo = pRNo;
	}

	public String getpDNo() {
		return pDNo;
	}

	public void setpDNo(String pDNo) {
		this.pDNo = pDNo;
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

	public String getCancYN() {
		return cancYN;
	}

	public void setCancYN(String cancYN) {
		this.cancYN = cancYN;
	}

	public Date getCancDate() {
		return cancDate;
	}

	public void setCancDate(Date cancDate) {
		this.cancDate = cancDate;
	}

	public String getPayYN() {
		return payYN;
	}

	public void setPayYN(String payYN) {
		this.payYN = payYN;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	
}
