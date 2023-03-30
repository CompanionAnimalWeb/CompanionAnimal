package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping(value = "/memberJoin")
	public static String memberJoin(Model model) {
		model.addAttribute("test", "회원 가입 페이지");
		return "memberJoin";
	}
	
	@PostMapping(value = "/successMemberJoin")
	   public static String successMemberJoin(HttpServletRequest httpServletRequest, Model model) {
		
		System.out.println("successMemberJoin 컨트롤러 실행");
		
		 // 전 페이지에서 받은 값 해당 클래스에 주입
		 MemberJoinController memberJoinController = new MemberJoinController();
		 memberJoinController.setInputId(httpServletRequest.getParameter("inputId"));
		 memberJoinController.setInputPW(httpServletRequest.getParameter("inputPW"));
		 memberJoinController.setInputName(httpServletRequest.getParameter("inputName"));
		 memberJoinController.setInputPhone(httpServletRequest.getParameter("inputPhone"));
	     //System.out.println(memberJoinController.getInputId());
	     
		 
		 //모델에 값 주입
	     model.addAttribute("test", "회원 가입 성공 페이지");
	     
	     model.addAttribute("inputId", memberJoinController.getInputId());
	     model.addAttribute("inputPW", memberJoinController.getInputPW());
	     model.addAttribute("inputName", memberJoinController.getInputName());
	     model.addAttribute("inputPhone", memberJoinController.getInputPhone());
	     
	     //데이터 베이스로 해당 정보 insert
	     userService.inset(memberJoinController);
	     
	     return "successMemberJoin";
	   }
}
