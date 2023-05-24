package com.example.demo.model;


// 댓글 DAO
public class Comment {
	
	private int commentIdx;
	private int boardIdx;
	private String id;
	private String content;
	private String regDate;
	
	
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public void setRegDate(String nowDate) {
 		this.regDate = nowDate;
	}
	
	@Override
	public String toString() {
		return "Comment [commentIdx=" + commentIdx + ", boardIdx=" + boardIdx + ", id=" + id + ", content="
				+ content + ", regDate=" + regDate + "]";
	}
	
	
	
	
}
