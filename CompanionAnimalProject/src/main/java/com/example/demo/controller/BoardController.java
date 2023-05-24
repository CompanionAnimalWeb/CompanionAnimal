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
import com.example.demo.model.User;
import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	/*
	 * private int boardIdx; 
	 * private String title; 
	 * private String content; 
	 * private String regDate; 
	 * private String id;
	 */

	private static BoardService boardService;
	private static CommentService commentService;
	private static ReplyService replyService;
	private static UserService userService;
		

    @Autowired
    public BoardController(CommentService commentService, BoardService boardService, ReplyService replyService, UserService userService) {
        this.commentService = commentService;
        this.boardService = boardService;
        this.replyService = replyService;
        this.userService = userService;
    }
    
    
	
	// 게시물 목록 
	@GetMapping(value = "/list")
	public String boardList(Model model) throws Exception  {
		
		List<Board> board = boardService.findAllBoard();
		model.addAttribute("boardList", board);
		
        return "board/community/main";
	}
	
//	// 게시판 목록 + 페이징 (구현 중 막힘)
//	@GetMapping(value = "/listPage")
//	public String boardListPage(Model model) throws Exception  {
//		
//		List<Board> board = boardService.findAllBoard();
//		model.addAttribute("boardList", board);
//		
//        return "board/community/main";
//	}
	
	
	// 게시물 작성
    @GetMapping(value="/write")
    public String boardWriteGet() throws Exception {
    	
        return "/board/community/write";
    }   
    
	// 게시물 등록
	@PostMapping(value="/write")
	public static String boardWritePost(Board board, Model model, HttpSession session) throws Exception {
		
		// 현재 시각
		String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		board.setRegDate(nowDate);		
		
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();
		board.setId(id);
		
		boardService.insert(board);
		
		return "redirect:/board/list";
		
	}
	
	// 게시물 조회
	@GetMapping(value = "/detail")
	public String boardDetail(@RequestParam("bno") int bno, Model model) throws Exception {

		
    	Board board = boardService.findPost(bno);
		List<Comment> commentList = commentService.findComment(bno);;
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
//		model.addAttribute("replyList", replyList);
		
		return "board/community/detail";
	}
	
	
	// 게시물 수정
	@GetMapping(value = "/modify")
	public String boardModifyGet(@RequestParam("bno") int bno, Model model) throws Exception {
		
		Board board = boardService.findPost(bno);
		model.addAttribute("board", board);
		
		return "board/community/modify";
	}
	
	// 게시물 수정
	@PostMapping(value="/modify")
	public static String boardModifyPost(Board board) throws Exception {

		boardService.modify(board);
		return "redirect:/board/detail?bno=" + board.getBoardIdx();
		
	}
	
	// 게시물 삭제
	@GetMapping(value="/delete")
	public static String boardDeletePost(@RequestParam("bno") int bno) throws Exception {

		boardService.delete(bno);
		return "redirect:/board/list";
		
	}
	
  
//    // 게시물 검색 
//	@GetMapping(value = "/listSearch")
//	public String boardListSearch(@RequestParam("keyword") String keyword, Model model) throws Exception  {
//		
//		List<Board> board = boardService.findPost(keyword, keyword);
//		model.addAttribute("boardList", board);
//		
//        return "redirect:/board/mainSearch?keyword=" + keyword;
//	}
	
	@GetMapping(value = "/community/myPage")
	public String myPage() {
		return "board/community/myPage";
	}
	
	/* 내가 쓴 글 확인 */
	@GetMapping(value = "/community/myPosts")
    public String myPosts(HttpSession session, Model model) throws Exception {
		
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();

		List<Board> userPosts = boardService.selectByUserId(id);
		
        model.addAttribute("boardList", userPosts);
    
        return "board/community/myPosts";
    }
	
	
	// 동물병원 메인 페이지
	@GetMapping(value = "/hospital/main")
	public static String hospitalMain(Model model) {
		model.addAttribute("test", "게시글 작성 페이지");
        return "board/hospital/main";
	}

	// 동물 서비스 메인 페이지
	@GetMapping(value = "/service/main")
	public static String serviceMain() {
        return "board/service/main";
	}
	
}
