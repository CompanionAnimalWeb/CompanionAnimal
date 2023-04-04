package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Board;
import com.example.demo.model.Comment;
import com.example.demo.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService{

	
	private final CommentRepository commentRepository;

    @Autowired
    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    // 특정 게시물 정보를 가져오는 메서드
    @Override
    public List<Comment> findComment(int no){
        return commentRepository.findComment(no);
    }
}
