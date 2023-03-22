package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@RequestMapping
	public static String mainBoard(Model model) {
		model.addAttribute("test", "게시판 메인 페이지");
        return "board";
	}
	
	@RequestMapping(value = "/write")
	public static String write(Model model) {
		model.addAttribute("test", "게시글 작성 페이지");
        return "write";
	}
	
	@RequestMapping(value = "/index")
	public static String mainPage() {
        return "index";
	}
}
