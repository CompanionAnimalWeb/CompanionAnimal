package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Dictionary;
import com.example.demo.service.DictionaryService;

@Controller
@RequestMapping(value = "/dictionary")
public class DictionaryController {

	private static DictionaryService dictionaryService;
	
	@Autowired
	public DictionaryController(DictionaryService dictionaryService) {
		this.dictionaryService = dictionaryService;
	}
	
	
	/* 메인 페이지, 강아지 연구소 */
	@GetMapping(value = "/main")
	public String mainGet(Dictionary dictionary, Model model) throws Exception {
		model.addAttribute("dictionaryList", dictionaryService.findAllPost());
		return "dictionary/main";
	}

	
	/* 게시물 등록 페이지로 이동 */
    @GetMapping(value="/write")
    public String writeGet() throws Exception {    	
        return "dictionary/write";
    }   

    
	/* 게시물 등록 */ 
	@PostMapping(value="/write")
	public static String writePost(Dictionary dictionary) throws Exception {
	 
		dictionaryService.insert(dictionary);	
		return "redirect:/dictionary/main";	
	}
	
	
	/* 게시물 디테일 */
	@GetMapping(value = "/detail")
	public String contentDetail(@RequestParam("no") int no, Model model) throws Exception {
		
    	Dictionary dictionary = dictionaryService.findPost(no);
    	
    	// DB에 저장된 텍스트에 대해 줄바꿈 치환
    	// 아래와 같은 처리를 해주지 않을 경우 텍스트가 한 줄로 출력 됨.
    	dictionary.setContent_item(dictionary.getContent_item().replace("\r\n","<br>"));
    	
		model.addAttribute("dictionary", dictionary);
		
		return "dictionary/detail";
	}
	
}
