package com.example.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Board;
import com.example.demo.model.Comment;
import com.example.demo.model.Reply;
import com.example.demo.repository.ReplyRepositoryImpl;
import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;
import com.example.demo.service.CommentServiceImpl;
import com.example.demo.service.ReplyService;

@Controller
@RequestMapping(value = "/board")
public class ReplyController {
	
	private static BoardService boardService;
	private static CommentService commentService;
	private static ReplyService replyService;


    @Autowired
    public ReplyController(CommentServiceImpl commentService, ReplyService replyService, 
    					BoardService boardService) {
        this.commentService = commentService;
        this.replyService = replyService;
        this.boardService = boardService;
    }
	
//	//게시물 상세 페이지
//	@RequestMapping(value = "board/community/main/post/comment/{no}")
//	public String communityPost(@PathVariable int no,Model model) {
//		
//		List<Reply> reply = replyRepository.findReply(no);
//		System.out.println(reply.get(0).getContent());
//		
//		return "board/community/comment";
//	}

    /* 답글 조회 */
    @GetMapping(value = "/comment/reply")
    public String replyList(@RequestParam("bno") int bno, @RequestParam("cno") int cno, Model model) throws Exception {
    	
    	Board board = boardService.findPost(bno);
		List<Comment> commentList = commentService.findComment(bno);
		List<Reply> replyList = replyService.findReply(cno);
		
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("cno", cno);

    	
    	return "board/community/comment/reply";
    }
    
	
	@PostMapping(value = "/comment/reply/write")
	public String insertReply(Reply reply) throws Exception {
		
		// 현재 시각
		String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		reply.setRegDate(nowDate);
		replyService.insert(reply);
		
		return "redirect:/board/detail?bno=" + reply.getBoardIdx();	
	}
	
	

}
