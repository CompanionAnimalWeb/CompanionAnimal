package com.example.demo.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
        MemberJoinController.userService = userService;
    }

    // 회원가입 성공시
    @PostMapping(value = "/successMemberJoin")
    public static String successMemberJoin(@Valid User user, BindingResult bindingResult, Model model) throws Exception {
      
       if(bindingResult.hasErrors()){
          model.addAttribute("user", user);
          return "member/join";
       }
        
       try {
          if(userService.selectByUserId(user.getId()) == null) {
             userService.insert(user);
          }      
          else {
        	 model.addAttribute("message", "이미 사용중인 아이디입니다.");
             return "member/join";
          }
       } catch(IllegalStateException e) {
          model.addAttribute("errorMessage", e.getMessage());
          return "member/join";
       }
        return "member/login";
   }
	
	
	// 로그인
	@PostMapping(value = "/signinCheck")
	public ModelAndView signinCheck(@ModelAttribute("test") User user, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
			
		// db에 사용자가 입력한 로그인 정보 확인
		try {
			User userInfo = userService.selectUser(user);
			session.setAttribute("userInfo", userInfo);
			mv.addObject("userInfo", userInfo);
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
