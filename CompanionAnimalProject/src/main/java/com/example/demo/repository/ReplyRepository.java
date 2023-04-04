package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Reply;

public interface ReplyRepository {
	List<Reply> findReply(int no);
}
