package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Reply;
import com.example.demo.repository.ReplyRepository;

@Service
public class ReplyServiceImpl implements ReplyService{

	private final ReplyRepository replyRepository;

    @Autowired
    public ReplyServiceImpl(ReplyRepository replyRepository) {
        this.replyRepository = replyRepository;
    }

    // 특정 게시물 정보를 가져오는 메서드
    @Override
    public List<Reply> findReply(int no) throws Exception {
        return replyRepository.findReply(no);
    }

	@Override
	public void insert(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		replyRepository.insert(reply);
		
	}

	@Override
	public void delete(int commentIdx, int replyIndx) throws Exception {
		// TODO Auto-generated method stub
		replyRepository.delete(commentIdx, replyIndx);
	}

	@Override
	public void modify(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		replyRepository.modify(reply);
	}
    
}
