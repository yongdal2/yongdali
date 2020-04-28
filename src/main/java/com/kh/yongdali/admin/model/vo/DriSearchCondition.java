package com.kh.yongdali.admin.model.vo;

public class DriSearchCondition {
	
	private String dNo;
	private String dmNo;
	private String mName; //db member에서 join해서 가지고 온다.
	private String capacity;
	private String type;
	private String carNo;
	private String content;

	
	
	public DriSearchCondition() {
		super();
	}



	public DriSearchCondition(String dNo, String dmNo, String mName, String capacity, String type, String carNo,
			String content) {
		super();
		this.dNo = dNo;
		this.dmNo = dmNo;
		this.mName = mName;
		this.capacity = capacity;
		this.type = type;
		this.carNo = carNo;
		this.content = content;
	}



	public String getdNo() {
		return dNo;
	}



	public void setdNo(String dNo) {
		this.dNo = dNo;
	}



	public String getDmNo() {
		return dmNo;
	}



	public void setDmNo(String dmNo) {
		this.dmNo = dmNo;
	}



	public String getmName() {
		return mName;
	}



	public void setmName(String mName) {
		this.mName = mName;
	}



	public String getCapacity() {
		return capacity;
	}



	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getCarNo() {
		return carNo;
	}



	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	@Override
	public String toString() {
		return "DriSearchCondition [dNo=" + dNo + ", dmNo=" + dmNo + ", mName=" + mName + ", capacity=" + capacity
				+ ", type=" + type + ", carNo=" + carNo + ", content=" + content + "]";
	} 
	
	
	
	
}