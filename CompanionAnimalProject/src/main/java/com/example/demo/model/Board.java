package com.example.demo.model;

import java.util.Date;

public class Board {
	
	private int borderIdx;
	private String title;
	private String content;
	private Date regDate;
	private String id;
	
	public int getBorderIdx() {
		return borderIdx;
	}
	public void setBorderIdx(int borderIdx) {
		this.borderIdx = borderIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
