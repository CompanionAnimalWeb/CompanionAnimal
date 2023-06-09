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
import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;
import com.example.demo.service.NotificationService;


@Controller
@RequestMapping(value = "/board")
public class CommentController {
	
	@Autowired private CommentService commentService;
	@Autowired private BoardService boardService;
	@Autowired private NotificationService notificationService;

	/* 댓글 등록 */
	@PostMapping(value = "/comment/write")
	public String insertPost(Comment comment) throws Exception {
		
		// 현재 시각
		String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		comment.setRegDate(nowDate);				
		commentService.insert(comment);
		Comment createdComment = commentService.lastComment();
		notificationService.handleCommentCreated(createdComment);
		
		return "redirect:/board/detail?bno=" + comment.getBoardIdx();
	}
	
	
	/* 댓글 삭제 */
	@GetMapping(value = "/comment/delete")
	public String deleteGet(@RequestParam("bno") int bno, @RequestParam("cno") int cno) throws Exception {
		
		commentService.delete(cno, bno);
		
		return "redirect:/board/detail?bno=" + bno;
	}
	
	/* 댓글 수정 */
	@GetMapping(value = "/comment/modify")
	public String modifyGet(@RequestParam("bno") int bno, @RequestParam("cno") int cno, Model model) throws Exception {
		
		Board board = boardService.findPost(bno);
		List<Comment> commentLst = commentService.findComment(bno);
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentLst);
		model.addAttribute("cno", cno);
		
		return "board/community/comment/modify";
	}	
	
	
	/* 댓글 수정 */
	@PostMapping(value = "/comment/modify")
	public String modifyPost(Comment comment) throws Exception {
		
		commentService.modify(comment);
		
		return "redirect:/board/detail?bno=" + comment.getBoardIdx();
	}
}
