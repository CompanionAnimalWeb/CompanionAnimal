package com.example.demo.model;

import java.time.LocalDateTime;
import java.util.Date;

public class Board {
	
	private int borderIdx;
	private String title;
	private String content;
	private LocalDateTime regDate;
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
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
