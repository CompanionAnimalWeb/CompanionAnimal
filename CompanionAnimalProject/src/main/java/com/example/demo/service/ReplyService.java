package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Reply;

public interface ReplyService {
	
	List<Reply> findReply(int no)  throws Exception;				// 답글 조회
	void insert(Reply reply) throws Exception;						// 답글 삽입
	void delete(int commentIdx, int replyIndx) throws Exception;	// 답글 삭제
	void modify(Reply reply) throws Exception;						// 답글 수정
	
}
