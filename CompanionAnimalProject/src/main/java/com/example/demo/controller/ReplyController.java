package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Reply;
import com.example.demo.repository.ReplyRepositoryImpl;
import com.example.demo.service.CommentServiceImpl;

@Controller
public class ReplyController {
	
	private static CommentServiceImpl commentService;
	private static ReplyRepositoryImpl replyRepository;


    @Autowired
    public ReplyController(CommentServiceImpl commentService, ReplyRepositoryImpl replyRepository) {
        this.commentService = commentService;
        this.replyRepository = replyRepository;
    }
	
	//게시물 상세 페이지
	@RequestMapping(value = "board/community/main/post/comment/{no}")
	public String communityPost(@PathVariable int no,Model model) {
		
		List<Reply> reply = replyRepository.findReply(no);
		System.out.println(reply.get(0).getContent());
		
		return "board/community/comment";
	}

}
