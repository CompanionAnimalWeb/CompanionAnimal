package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
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
