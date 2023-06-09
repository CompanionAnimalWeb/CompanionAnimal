package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.model.Board;
import com.example.demo.model.User;
import com.example.demo.service.BoardService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	
	private static UserService userService;
	private static BoardService boardService;
	
	@Autowired
	public MyPageController(UserService userService, BoardService boardService) {
		this.userService = userService;
		this.boardService = boardService;
	}
 
	static User userInfo = User.getInstance();
	 
	/* 마이페이지 이동 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String joinGet() {
		return "mypage/main";
	}
		
	
	/* 내가 쓴 글 확인 */
	@GetMapping(value = "/myPosts")
    public String myPosts(HttpSession session, Model model) throws Exception {
		
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();

		List<Board> userPosts = boardService.selectByUserId(id);
		
        model.addAttribute("boardList", userPosts);
    
        return "mypage/myPosts";
    }
	
	
}
