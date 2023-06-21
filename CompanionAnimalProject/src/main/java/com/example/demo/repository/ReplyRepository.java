package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Reply;

public interface ReplyRepository {
	
	List<Reply> findReply(int cno)  throws Exception;				// 답글 조회
	Reply findSingleReply(int no) throws Exception;
	void insert(Reply reply) throws Exception;						// 답글 삽입
	void delete(int commentIdx, int replyIndx) throws Exception;	// 답글 삭제
	void modify(Reply reply) throws Exception;						// 답글 수정
	
}
