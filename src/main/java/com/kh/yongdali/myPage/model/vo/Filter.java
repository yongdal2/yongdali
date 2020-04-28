package com.kh.yongdali.myPage.model.vo;

import java.sql.Date;



public class Filter {
	private String mNo;
	private String dNo;
	private String rsvStatus;
	private String calStatus;
	private Date stDate;
	private Date edDate;
	private String fSearch;
	
	
	public Filter() {
	}


	public Filter(String mNo, String dNo, String rsvStatus, String calStatus, Date stDate, Date edDate,
			String fSearch) {
		super();
		this.mNo = mNo;
		this.dNo = dNo;
		this.rsvStatus = rsvStatus;
		this.calStatus = calStatus;
		this.stDate = stDate;
		this.edDate = edDate;
		this.fSearch = fSearch;
	}


	public String getmNo() {
		return mNo;
	}


	public void setmNo(String mNo) {
		this.mNo = mNo;
	}


	public String getdNo() {
		return dNo;
	}


	public void setdNo(String dNo) {
		this.dNo = dNo;
	}


	public String getRsvStatus() {
		return rsvStatus;
	}


	public void setRsvStatus(String rsvStatus) {
		this.rsvStatus = rsvStatus;
	}


	public String getCalStatus() {
		return calStatus;
	}


	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}


	public Date getStDate() {
		return stDate;
	}


	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}


	public Date getEdDate() {
		return edDate;
	}


	public void setEdDate(Date edDate) {
		this.edDate = edDate;
	}


	public String getfSearch() {
		return fSearch;
	}


	public void setfSearch(String fSearch) {
		this.fSearch = fSearch;
	}


	@Override
	public String toString() {
		return "Filter [mNo=" + mNo + ", dNo=" + dNo + ", rsvStatus=" + rsvStatus + ", calStatus=" + calStatus
				+ ", stDate=" + stDate + ", edDate=" + edDate + ", fSearch=" + fSearch + "]";
	}

	
}
