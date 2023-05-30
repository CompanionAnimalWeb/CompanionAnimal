package com.example.demo.model;

// 동물보감에 사용될 테이블
public class Dictionary {
	
	private int content_idx;
	private String content_title;
	private String content_item;
	
	public int getContent_idx() {
		return content_idx;
	}
	public void setContent_idx(int content_idx) {
		this.content_idx = content_idx;
	}
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent_item() {
		return content_item;
	}
	public void setContent_item(String content_item) {
		this.content_item = content_item;
	}
	
	@Override
	public String toString() {
		return "Dictionary [content_idx=" + content_idx + ", content_title=" + content_title + ", content_item="
				+ content_item + "]";
	}

}
