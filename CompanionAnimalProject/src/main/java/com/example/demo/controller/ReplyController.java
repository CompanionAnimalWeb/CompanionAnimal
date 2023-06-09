package com.example.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Board;
import com.example.demo.model.Comment;
import com.example.demo.model.Reply;
import com.example.demo.model.User;
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
    
    static User userInfo = User.getInstance();

    /* 답글 조회 */
    @GetMapping(value = "/comment/reply")
    public String replyList(@RequestParam("bno") int bno, @RequestParam("cno") int cno, Model model) throws Exception {
    	
    	Board board = boardService.findPost(bno);
		Comment comment = commentService.findSingleComment(cno);
		List<Reply> replyList = replyService.findReply(cno);
		
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("cno", cno);

    	
    	return "board/community/comment/reply";
    }
    
	//답글 입력
	@PostMapping(value = "/comment/reply/write")
	public String insertReply(Reply reply, HttpSession session) throws Exception {
		
		// 현재 시각
		String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		reply.setRegDate(nowDate);
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();
		reply.setId(id);
		replyService.insert(reply);
		
		return "redirect:/board/detail?bno=" + reply.getBoardIdx();	
	}
	
	//답글 삭제
	@GetMapping(value = "/comment/reply/delete")
	public String deleteReply(@RequestParam("bno") int bno,@RequestParam("cno") int cno, @RequestParam("rno") int rno) throws Exception {
		
		replyService.delete(cno, rno);
		
		return "redirect:/board/detail?bno=" + bno;
	}
	
	//답글 수정
	@GetMapping(value = "/comment/reply/modify")
	public String modifyGet(@RequestParam("bno") int bno, @RequestParam("cno") int cno,@RequestParam("rno") int rno, Model model) throws Exception {
		
		Board board = boardService.findPost(bno);
		Comment comment = commentService.findSingleComment(cno);
		Reply reply = replyService.findSingleReply(rno);
		
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		model.addAttribute("cno", cno);
		model.addAttribute("reply",reply);
		model.addAttribute(rno);
		
		return "board/community/comment/replyModify";
	}	
	
	
	//답글 수정
	@PostMapping(value = "/comment/reply/modify")
	public String modifyPost(Reply reply) throws Exception {
		replyService.modify(reply);
		
		return "redirect:/board/comment/reply?bno=" + reply.getBoardIdx() + "&cno=" + reply.getCommentIdx();
	}
}
