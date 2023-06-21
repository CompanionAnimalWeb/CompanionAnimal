package com.example.demo.service;

import com.example.demo.model.Comment;

public interface CommentObserver {
	void handleCommentCreated(Comment comment) throws Exception;
}
