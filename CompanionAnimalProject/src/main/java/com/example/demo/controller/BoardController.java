package com.example.demo.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Board;
import com.example.demo.service.BoardService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	
	private String inputTitle;
	private String inputContent;  
	private LocalDateTime legDate;
	private String id;

	public String getInputTitle() {
		return inputTitle;
	}

	public void setInputTitle(String inputTitle) {
		this.inputTitle = inputTitle;
	}

	public String getInputContent() {
		return inputContent;
	}

	public void setInputContent(String inputContent) {
		this.inputContent = inputContent;
	}
	
	public LocalDateTime getLegDate() {
		return legDate;
	}

	public void setLegDate(LocalDateTime legDate) {
		this.legDate = legDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private static UserService userService;
	private static BoardService boardService;


    @Autowired
    public BoardController(UserService userService, BoardService boardService) {
        this.userService = userService;
        this.boardService = boardService;
    }

	public BoardController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping
	public static String mainBoard(Model model) {
		
//		List<User> users = userService.findUsers();
//		model.addAttribute("id",users.get(0).getId().toString());
//		model.addAttribute("name",users.get(0).getName().toString());
//		model.addAttribute("phone",users.get(0).getPhone().toString());
//		model.addAttribute("test", "게시판 메인 페이지");
        return "board/community/main";
	}
	
	// 커뮤니티 메인 페이지
	@RequestMapping(value = "/community/main")
	public String communityMain(Model model) {
		
		List<Board> board = boardService.findAllBoard();
		System.out.println(board.get(0).getTitle());
		model.addAttribute("boardList",board);
        return "board/community/main";
	}
	
	//게시물 상세 페이지
	@RequestMapping(value = "/community/main/post/{no}")
	public String communityPost(@PathVariable int no,Model model) {
		
		List<Board> board = boardService.findPost(no);
		System.out.println(board.get(0).getTitle());
		model.addAttribute("post",board);
		
		return "board/community/post";
	}
	
	// 커뮤니티 글 작성 
    @RequestMapping(value="/community/write")
    public String communityWrite() throws Exception {
        return "/board/community/write";
    }

    
	// 동물병원 메인 페이지
	@RequestMapping(value = "/hospital/main")
	public static String hospitalMain(Model model) {
		model.addAttribute("test", "게시글 작성 페이지");
        return "board/hospital/main";
	}
	
	// 동물 서비스 메인 페이지
	@RequestMapping(value = "/service/main")
	public static String serviceMain() {
        return "board/service/main";
	}

	//게신물 작성 코드
	@RequestMapping(value="/community/main/test")
	public static String communityWrite(HttpServletRequest httpServletRequest, Model model) {
		
		System.out.println("글쓰기 컨트롤러 실행");
		System.out.println(httpServletRequest.getParameter("inputTitle"));
		System.out.println(httpServletRequest.getParameter("inputContent"));
		//현재 날짜
		LocalDateTime now = LocalDateTime.now();
		
		 // 전 페이지에서 받은 값 해당 클래스에 주입
		 BoardController boardController = new BoardController();
		 boardController.setInputTitle(httpServletRequest.getParameter("inputTitle"));
		 boardController.setInputContent(httpServletRequest.getParameter("inputContent"));
		 boardController.setLegDate(now);
	     //System.out.println(memberJoinController.getInputId());
		boardService.inset(boardController);
		model.addAttribute("chek","성공");
		
		return "redirect:/board/community/main";
		
	}

}
