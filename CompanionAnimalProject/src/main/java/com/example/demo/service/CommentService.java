package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Comment;

public interface CommentService {
	public List<Comment> findComment(int no);
}
