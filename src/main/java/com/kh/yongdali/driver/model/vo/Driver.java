package com.kh.yongdali.driver.model.vo;

public class Driver {

	private String dNo;
	private String dmNo;
	private float capacity;
	private String type;
	private String carNo;
	private String idImgOrigin;
	private String idImgRename;
	private String regCardImgOrigin;
	private String regCardImgRename;	
	
	public Driver() {
		// TODO Auto-generated constructor stub
	}

	public Driver(String dNo, String dmNo, float capacity, String type, String carNo, String idImgOrigin,
			String idImgRename, String regCardImgOrigin, String regCardImgRename) {
		super();
		this.dNo = dNo;
		this.dmNo = dmNo;
		this.capacity = capacity;
		this.type = type;
		this.carNo = carNo;
		this.idImgOrigin = idImgOrigin;
		this.idImgRename = idImgRename;
		this.regCardImgOrigin = regCardImgOrigin;
		this.regCardImgRename = regCardImgRename;
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

	public float getCapacity() {
		return capacity;
	}

	public void setCapacity(float capacity) {
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

	public String getIdImgOrigin() {
		return idImgOrigin;
	}

	public void setIdImgOrigin(String idImgOrigin) {
		this.idImgOrigin = idImgOrigin;
	}

	public String getIdImgRename() {
		return idImgRename;
	}

	public void setIdImgRename(String idImgRename) {
		this.idImgRename = idImgRename;
	}

	public String getRegCardImgOrigin() {
		return regCardImgOrigin;
	}

	public void setRegCardImgOrigin(String regCardImgOrigin) {
		this.regCardImgOrigin = regCardImgOrigin;
	}

	public String getRegCardImgRename() {
		return regCardImgRename;
	}

	public void setRegCardImgRename(String regCardImgRename) {
		this.regCardImgRename = regCardImgRename;
	}

	@Override
	public String toString() {
		return "Driver [dNo=" + dNo + ", dmNo=" + dmNo + ", capacity=" + capacity + ", type=" + type + ", carNo="
				+ carNo + ", idImgOrigin=" + idImgOrigin + ", idImgRename=" + idImgRename + ", regCardImgOrigin="
				+ regCardImgOrigin + ", regCardImgRename=" + regCardImgRename + "]";
	}

	
}
