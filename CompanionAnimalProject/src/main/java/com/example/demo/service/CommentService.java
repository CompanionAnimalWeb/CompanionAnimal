package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Comment;

public interface CommentService {
	
	List<Comment> findComment(int no) throws Exception;				// 댓글 조회
	void insert(Comment comment) throws Exception;					// 댓글 삽입
	void delete(int commentIdx, int boardIdx) throws Exception;		// 댓글 삭제
	void modify(Comment comment) throws Exception;					// 댓글 수정
}
