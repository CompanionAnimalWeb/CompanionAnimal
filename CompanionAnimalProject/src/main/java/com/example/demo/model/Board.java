package com.example.demo.model;

import java.io.File;
import java.util.Optional;

public class Board {
	
	private int boardIdx;
	private String title;
	private String content;
	private String regDate;
	
	private String id;
	
	//이미지
	private String imageUrl;
	private File BoardImage;
	
	/* 검색 필터 */
	public String keyword;
	
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int borderIdx) {
		this.boardIdx = borderIdx;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public File getBoardImage() {
		return BoardImage;
	}
	public void setBoardImage(File boardImage) {
		BoardImage = boardImage;
	}
	
}
