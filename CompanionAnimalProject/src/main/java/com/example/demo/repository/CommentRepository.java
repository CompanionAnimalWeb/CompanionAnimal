package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Comment;

public interface CommentRepository {
	List<Comment> findComment(int no);
}
