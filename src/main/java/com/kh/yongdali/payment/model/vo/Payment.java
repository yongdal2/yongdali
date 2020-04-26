package com.kh.yongdali.payment.model.vo;

import java.sql.Date;

public class Payment {
	private String pNo;
	private String pRNo;
	private String dealYN;
	private Date dealDate;
	private String cancYN;
	private Date cancDate;
	private String payYN;
	private Date enrollDate;
	private String cancAmount;
	
	public Payment() {}

	public Payment(String pNo, String pRNo, String pDNo, String dealYN, Date dealDate, String cancYN, Date cancDate,
			String payYN, Date enrollDate, String cancAmount) {
		super();
		this.pNo = pNo;
		this.pRNo = pRNo;
		this.dealYN = dealYN;
		this.dealDate = dealDate;
		this.cancYN = cancYN;
		this.cancDate = cancDate;
		this.payYN = payYN;
		this.enrollDate = enrollDate;
		this.cancAmount = cancAmount;
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

	public String getCancAmount() {
		return cancAmount;
	}

	public void setCancAmount(String cancAmount) {
		this.cancAmount = cancAmount;
	}

	@Override
	public String toString() {
		return "Payment [pNo=" + pNo + ", pRNo=" + pRNo + ", dealYN=" + dealYN + ", dealDate=" + dealDate + ", cancYN="
				+ cancYN + ", cancDate=" + cancDate + ", payYN=" + payYN + ", enrollDate=" + enrollDate
				+ ", cancAmount=" + cancAmount + "]";
	}
	
	
	
}
