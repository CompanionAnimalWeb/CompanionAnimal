package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Board;
import com.example.demo.model.Comment;

public interface CommentRepository {
	
	List<Comment> findComment(int no) throws Exception;				// 댓글 조회
	void insert(Comment comment) throws Exception;					// 댓글 삽입
	void delete(int commentIdx, int boardIdx) throws Exception;		// 댓글 삭제
	void modify(Comment comment) throws Exception;					// 댓글 수정
	String findUserName(int commentIdx) throws Exception;	// 댓글이 작성된 게시물의 작성자
	public Comment lastComment() throws Exception; // 가장 최근에 추가된 댓글
}
