package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/member")
public class MemberJoinController {
	

	//의존 주입
	private static UserService userService;

    @Autowired
    public MemberJoinController(UserService userService) {
        this.userService = userService;
    }
    
    
	// 회원가입
	@PostMapping("/join")
	public String memberJoinPost() {
		return "member/Join";
	}
	
//	// 로그인 페이지
//	@RequestMapping("/login")
//	public String signin() {
//		return "member/signin";
//	}
//	

	// 회원가입 성공시
	@PostMapping(value = "/member/successMemberJoin")
	   public static String successMemberJoin(User user, Model model) {
		
		System.out.println("successMemberJoin 컨트롤러 실행");

	    userService.insert(user);
	     
	     return "member/successMemberJoin";
	   }
	

	@PostMapping(value = "/member/signinCheck")
	public ModelAndView signinCheck(@ModelAttribute("test") User user) {
		
		ModelAndView mv = new ModelAndView();
		
		// db에 사용자가 입력한 로그인 정보 확인
		try {
			User result = userService.selectUser(user);	
			mv.addObject("userInfo", result);
			return mv;
			
		// 아이디나 비밀번호가 달라 예외가 발생한 경우 다시 로그인 페이지로 리다이렉트
		} catch(Exception e) {
			mv.setViewName("redirect:/signin");
			return mv;
		}
	}

}
