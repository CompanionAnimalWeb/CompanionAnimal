package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Comment;
import com.example.demo.repository.CommentRepository;

@Service
public class NotificationService implements CommentObserver{

	
	@Autowired private final CommentRepository commentRepository;

    
    public NotificationService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }
	
	@Override
	public void handleCommentCreated(Comment comment) throws Exception {
        
		// 게시물 작성자에게 알림을 보내는 작업을 수행합니다.
        String username = commentRepository.findUserName(comment.getCommentIdx());

        String notificationMessage = "게시물에 새로운 댓글이 작성되었습니다.";
        sendNotification(username, notificationMessage);
	}
	
	  private void sendNotification(String username, String message) {
	        // 알림 전송 로직을 구현합니다.
	        // 예시로는 간단하게 콘솔에 알림 메시지를 출력하는 것으로 대체합니다.
	        System.out.println("게시물 작성자: " + username);
	        System.out.println("알림 내용: " + message);
	    }
}
