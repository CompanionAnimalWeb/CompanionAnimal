package com.example.demo.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private static UserService userService;
	
	@Autowired
	public MemberController(UserService userService) {
		MemberController.userService = userService;
	}
    
	 
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGet() {
		return "member/join";
	}
		

	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		return "member/login";
	}
	
	/* 회원가입 성공시 */
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
	
	
    /* 로그인 체크 */
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
	
	/* 로그인 세션 확인 */
	@GetMapping("/main")
    public String login(HttpSession session) {
        User userInfo = (User) session.getAttribute("id");
        if (userInfo == null) {
            return "redirect:/login";
        }
        return "main";
    }
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    session.invalidate();
	    return "redirect:/main";
	}
	
	/* 비밀번호 변경 */
	@GetMapping(value = "/modify")
	public String modifyGet(@Valid HttpSession session, Model model) throws Exception {
		User userInfo = (User) session.getAttribute("userInfo");
		String id = userInfo.getId();
		System.out.println(id);
		userService.selectByUserId(id);
		return "member/modify";
	}
	
	@PostMapping(value = "/modify")
	public static String modifyPost(User user) throws Exception {
		userService.modify(user);
		return "member/modify";
		//return "redirect:/main";
	}
	
	/* 회원 탈퇴 */
	@GetMapping(value = "/delete")
	public String deleteGet() {
		return "member/delete";
	}
	
	@PostMapping(value = "/delete")
	public static String deletePost(User user, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		User userInfo = (User) session.getAttribute("userInfo");
		String sessionPass = userInfo.getPassword();
		String userPass = user.getPassword();
		
		if(!(sessionPass.equals(userPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/delete";
		}
		
		userService.delete(user);
		session.invalidate();
		return "redirect:/main";
	}
	
	/* 아이디 찾기 */
	@GetMapping(value = "/findInfo")
	public String findInfoGet() {
		return "member/findInfo";
	}
	
	/*
	@PostMapping(value = "/findInfo")
	public ModelAndView findInfoPost(User user) throws Exception {

		ModelAndView mv = new ModelAndView();
		
		User userInfo = userService.findId(user);

		mv.addObject("userInfo", userInfo);
	
		if(userInfo != null) {
			mv.addObject("message", "찾으시는 아이디는 ''");
			mv.setViewName("/member/login");
			return mv;
		} else {
			mv.addObject("message", "일치하는 정보가 없습니다.");
			mv.setViewName("/member/findInfo");
			return mv;
		}
	}*/

	
}
