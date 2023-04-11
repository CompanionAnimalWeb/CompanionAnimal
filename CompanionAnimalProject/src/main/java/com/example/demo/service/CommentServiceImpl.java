package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Comment;
import com.example.demo.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService{

	
	@Autowired private final CommentRepository commentRepository;

    
    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    // 특정 게시물 정보를 가져오는 메서드
    @Override
    public List<Comment> findComment(int no) throws Exception {
        return commentRepository.findComment(no);
    }

   /* 댓글 등록 */
   @Override
   public void insert(Comment comment) throws Exception {
	   commentRepository.insert(comment);
   }

   /* 댓글 삭제 */
	@Override
	public void delete(int commentIdx, int boardIdx) throws Exception {
		commentRepository.delete(commentIdx, boardIdx);
		
	}
	
	/* 댓글 수정*/
	@Override
	public void modify(Comment comment) throws Exception {
		commentRepository.modify(comment);
	}
}
