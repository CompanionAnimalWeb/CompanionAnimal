package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/member")
public class MemberJoinController {

	//의존 주입
	private static UserService userService;
	private static String message = "";
	
    @Autowired
    public MemberJoinController(UserService userService) {
        MemberJoinController.userService = userService;
    }
    
	// 회원가입 성공시
    @ResponseBody
	@PostMapping(value = "/successMemberJoin")
	public static String successMemberJoin(User user, Model model) throws Exception {
		
		// 회원가입이 완료되었습니다 알림창 출력 추가예정
		if(userService.selectByUserId(user.getId()) == null) {
			userService.insert(user);
			message = "<script>alert('회원가입이 완료되었습니다. 로그인 해주세요!'); location.href='login';</script>";
			return message;
			//return "member/login";
		}
		else {
			message = "<script>alert('이미 사용중인 아이디입니다.'); location.href='join';</script>";
			return message;
			//return "redirect:/member/join";
		}
	}
	
	// 로그인
	@PostMapping(value = "/signinCheck")
	public ModelAndView signinCheck(@ModelAttribute("test") User user) {
		
		ModelAndView mv = new ModelAndView();
			
		// db에 사용자가 입력한 로그인 정보 확인
		try {
			User result = userService.selectUser(user);	
			mv.addObject("userInfo", result);
			mv.setViewName("/main");
			return mv;
			
		// 아이디나 비밀번호가 달라 예외가 발생한 경우 다시 로그인 페이지로 리다이렉트
		} catch(Exception e) {
			mv.addObject("message", "아이디와 비밀번호를 다시 입력해주세요.");
			mv.setViewName("/member/login");
			return mv;
		}
	}

}
