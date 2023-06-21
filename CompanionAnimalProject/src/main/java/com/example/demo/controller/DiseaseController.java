package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.DiseaseService;

@Controller
@RequestMapping(value = "/disease")
public class DiseaseController {
	private static DiseaseService diseaseService;
	
    @Autowired
    public DiseaseController(DiseaseService diseaseService) {
        this.diseaseService = diseaseService;
    }
    
    /*반려견 관련*/

    /* 강아지 연구소 */
	// 반려견에 대한 증상 리스트
    @GetMapping(value="/dog")
    public String dogDiseaseGet(Model model) throws Exception {
    	
    	List<?> list = diseaseService.dogDiseaseList();
    	model.addAttribute("dogList", list);

        return "/disease/dog";
    }
    
    // 반려묘 증상을 선택 => 해당되는 세부 증상 나열
    @GetMapping(value="/dog/detail")
    public String selectDogDisease(@RequestParam("select") String select, Model model) throws Exception {
    	
    	
    	List<?> list = diseaseService.selectDogDisease(select);
    	
    	model.addAttribute("select",select);
    	model.addAttribute("dogList", list);
    	
    	return "/disease/dogDetail";
    }
    
    @PostMapping(value = "/dog/detail/name")
    public String dogDiseaseName(HttpServletRequest request, Model model) throws Exception {
    	
    	
        String[] selectedValues = request.getParameterValues("selectedValues");
        
        List<?> list = diseaseService.dogDiseaseName(selectedValues);
        
        model.addAttribute("dogList", list);
        
        
        return "/disease/dogDiseaseName";
    }
    
    /*반려묘 관련*/
    
	/* 고양이 연구소 */
	// 반려묘에 대한 증상 리스트
    @GetMapping(value="/cat")
    public String catDiseaseGet(Model model) throws Exception {
    	
    	List<?> list = diseaseService.catDiseaseList();
    	model.addAttribute("catList", list);

        return "/disease/cat";
    }
   
    // 반려묘 증상을 선택 => 해당되는 세부 증상 나열
    @GetMapping(value="/cat/detail")
    public String selectCatDisease(@RequestParam("select") String select, Model model) throws Exception {
    	
    	
    	List<?> list = diseaseService.selectCatDisease(select);
    	
    	model.addAttribute("select",select);
    	model.addAttribute("catList", list);
    	
    	return "/disease/catDetail";
    }
    
    @PostMapping(value = "/cat/detail/name")
    public String catDiseaseName(HttpServletRequest request, Model model) throws Exception {
    	
        String[] selectedValues = request.getParameterValues("selectedValues");
        
        List<?> list = diseaseService.catDiseaseName(selectedValues);
        
        model.addAttribute("catList", list);
        
        
        return "/disease/catDiseaseName";
    }
    
}
