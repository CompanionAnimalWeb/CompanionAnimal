package com.example.demo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
public class MemberJoinController {
	
	private String inputId;
	private String inputPW;
	private String inputName;
	private String inputPhone;
	
	//의존 주입
	private static UserService userService;

    @Autowired
    public MemberJoinController(UserService userService) {
        this.userService = userService;
    }
    
    //값 주입을 위한 기본 생성자
    public MemberJoinController() {
    	
    }

	public String getInputId() {
		return inputId;
	}

	public void setInputId(String inputId) {
		this.inputId = inputId;
	}

	public String getInputPW() {
		return inputPW;
	}

	public void setInputPW(String inputPW) {
		this.inputPW = inputPW;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getInputPhone() {
		return inputPhone;
	}

	public void setInputPhone(String inputPhone) {
		this.inputPhone = inputPhone;
	}

	//회원가입 페이지
	@RequestMapping("/member/register")
	public String memberRegister() {
		return "member/register";
	}
	
	@RequestMapping("/member/successMemberJoin")
	public ModelAndView idCheck(@ModelAttribute("registerData") User user) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println(user.getId());
		userService.selectUserById(user.getId());
		userService.insertUser(user);
		return mv;
		/*
		 * if(userService.selectUserById(user.getId()) == null) {
		 * System.out.println("유저조회성공"); userService.insertUser(user);
		 * mv.setViewName("member/successMemberJoin"); return mv; } else {
		 * mv.addObject("user", user); mv.addObject("error", "아이디가 이미 존재합니다.");
		 * mv.setViewName("member/register"); return mv; }
		 */
	}
	

	// 로그인 페이지
	@RequestMapping("/member/signin")
	public String signin() {
		return "member/signin";
	}
	/*
	// 회원가입 성공시
	@PostMapping(value = "/member/successMemberJoin")
	   public static String successMemberJoin(HttpServletRequest httpServletRequest, Model model) {
		
		System.out.println("successMemberJoin 컨트롤러 실행");
		
		 // 전 페이지에서 받은 값 해당 클래스에 주입
		 MemberJoinController memberJoinController = new MemberJoinController();
		 memberJoinController.setInputId(httpServletRequest.getParameter("inputId"));
		 memberJoinController.setInputPW(httpServletRequest.getParameter("inputPW"));
		 memberJoinController.setInputName(httpServletRequest.getParameter("inputName"));
		 memberJoinController.setInputPhone(httpServletRequest.getParameter("inputPhone"));
	     //System.out.println(memberJoinController.getInputId());
	     
		 
		 // 모델에 값 주입
//	     model.addAttribute("test", "회원 가입 성공 페이지");
//	     
//	     model.addAttribute("inputId", memberJoinController.getInputId());
//	     model.addAttribute("inputPW", memberJoinController.getInputPW());
//	     model.addAttribute("inputName", memberJoinController.getInputName());
//	     model.addAttribute("inputPhone", memberJoinController.getInputPhone());
//	     
	     //데이터 베이스로 해당 정보 insert
	     userService.insert(memberJoinController);
	     
	     return "member/successMemberJoin";
	   }*/
	

	@PostMapping(value = "/member/signinCheck")
	public ModelAndView signinCheck(@Valid @ModelAttribute("signinData") User user) {
		
		ModelAndView mv = new ModelAndView();
		
		// db에 사용자가 입력한 로그인 정보 확인
		try {
			User result = userService.selectUser(user);	
			mv.addObject("userInfo", result);
			return mv;
			
		// 아이디나 비밀번호가 달라 예외가 발생한 경우 다시 로그인 페이지로 리다이렉트
		} catch(Exception e) {
			mv.setViewName("/member/signin");
			return mv;
		}
	}

}
