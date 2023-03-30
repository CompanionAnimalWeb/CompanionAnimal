package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String loginGet() {
		return "member/join";
	}
		

	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String joinGet() {
		return "member/login";
	}
	
}
