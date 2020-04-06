package com.kh.yongdali.notice.model.vo;

import java.sql.Date;

public class Notice {
	// 공지사항(사용자 / 사업자 공동 사용)
	
	private String nNo;
	private String nTitle;
	private String nWriter;
	private String nContent;
	private String nImgOrigin;
	private String nImgRename;
	private String nSort;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nStatus;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(String nNo, String nTitle, String nWriter, String nContent, String nImgOrigin, String nImgRename,
			String nSort, Date nCreateDate, Date nModifyDate, String nStatus) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nImgOrigin = nImgOrigin;
		this.nImgRename = nImgRename;
		this.nSort = nSort;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
	}

	public String getnNo() {
		return nNo;
	}

	public void setnNo(String nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnImgOrigin() {
		return nImgOrigin;
	}

	public void setnImgOrigin(String nImgOrigin) {
		this.nImgOrigin = nImgOrigin;
	}

	public String getnImgRename() {
		return nImgRename;
	}

	public void setnImgRename(String nImgRename) {
		this.nImgRename = nImgRename;
	}

	public String getnSort() {
		return nSort;
	}

	public void setnSort(String nSort) {
		this.nSort = nSort;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nWriter=" + nWriter + ", nContent=" + nContent
				+ ", nImgOrigin=" + nImgOrigin + ", nImgRename=" + nImgRename + ", nSort=" + nSort + ", nCreateDate="
				+ nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus=" + nStatus + "]";
	}
}