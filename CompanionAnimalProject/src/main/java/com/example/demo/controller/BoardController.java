package com.example.demo.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpSession;

import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Board;
import com.example.demo.model.BoardImages;
import com.example.demo.model.Comment;
import com.example.demo.model.User;
import com.example.demo.model.Criteria;
import com.example.demo.model.PageMaker;
import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

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
	public String boardList(@RequestParam("page") int page,Model model,Criteria criteria) throws Exception  {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.count());
		//List<Board> board = boardService.findAllBoard();
		
		model.addAttribute("boardList", boardService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
        return "board/community/main";
	}
	
	// 게시물 작성
    @GetMapping(value="/write")
    public String boardWriteGet() throws Exception {
    	
        return "/board/community/write";
    }   

	// 게시물 등록
	@PostMapping(value="/write")
	public static String boardWritePost(Board board, @RequestParam("file") MultipartFile file, Model model, HttpSession session) throws Exception {
	 
		// 현재 시각
		String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		board.setRegDate(nowDate);
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();
		board.setId(id);
		
		BoardImages boardImages = new BoardImages();
		//파일 업로드
        String saveName = file.getOriginalFilename();
        //System.out.println(saveName);
        File saveFile = new File("C:\\upload",saveName); 

        if (file != null && !file.isEmpty()) {
            try {
            	file.transferTo(saveFile);  
            } catch (Exception e) {
                throw new RuntimeException("이미지 업로드가 실패하였습니다", e);
            }
        }
		
		boardService.insert(board);
		
		boardImages.setUrl(saveName);
		boardImages.setBoardIdx(boardService.lastBoard().getBoardIdx());
		boardService.insertImages(boardImages);
		
		return "redirect:/board/list?page=1";
		
	}
	
	// 특정 게시물 조회
	@GetMapping(value = "/detail")
	public String boardDetail(@RequestParam("bno") int bno, Model model) throws Exception {
		
    	Board board = boardService.findPost(bno);
		List<Comment> commentList = commentService.findComment(bno);
		Optional<String> imageUrlOptional  = boardService.findImages(bno);
		String saveName = imageUrlOptional.orElse(null);
		
		if(saveName != null) {
			board.setImageUrl(saveName);
		}

		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		
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
		return "redirect:/board/list?page=1";
		
	}
	
  
    // 게시물 검색 
	@GetMapping(value = "/listSearch")
	public String boardListSearch(@RequestParam("keyword") String keyword, Model model,Criteria criteria) throws Exception  {
		
		if(keyword.equals("")) {
			return "redirect:/board/list?page=1"; 
		}
		else {
		List<Board> board = boardService.findPost(keyword, keyword);
		model.addAttribute("boardList", board);
		
		return "board/community/main";
		}
	}
	
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
