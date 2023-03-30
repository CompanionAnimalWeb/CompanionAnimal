package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static UserService userService;


    @Autowired
    public BoardController(UserService userService) {
        this.userService = userService;
    }

	@RequestMapping
	public static String mainBoard(Model model) {
		
		List<User> users = userService.findUsers();
		model.addAttribute("id",users.get(0).getId().toString());
		model.addAttribute("name",users.get(0).getName().toString());
		model.addAttribute("phone",users.get(0).getPhone().toString());
		model.addAttribute("test", "게시판 메인 페이지");
        return "board/community/main";
	}
	
	// 커뮤니티 메인 페이지
	@RequestMapping(value = "/community/main")
	public static String communityMain(Model model) {
		model.addAttribute("test", "게시판 메인 페이지");
		return "board/community/main";
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

}
