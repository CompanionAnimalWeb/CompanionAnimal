package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;
import com.example.demo.service.DiseaseService;

@Controller
@RequestMapping(value = "/disease")
public class DiseaseController {
	private static DiseaseService diseaseService;
	
    @Autowired
    public DiseaseController(DiseaseService diseaseService) {
        this.diseaseService = diseaseService;
    }

	// 반려견에 대한 증상 리스트(강아지 연구소)
    @GetMapping(value="/dog")
    public String dogDiseaseGet(Model model) throws Exception {
    	
    	List<DogDisease> list = diseaseService.dogDeseaseList();
    	
		/*
		 * // 이렇게 뽑으면 카테고리 하나당 여러개의 질병 나열할 수 있습니당 for(int i =0; i < list.size(); i++) {
		 * System.out.println(list.get(i).getDiseaseCategory()); String input =
		 * list.get(i).getMainSymptom(); String[] elements = input.split(",");
		 * 
		 * for (String element : elements) { System.out.println(element.trim()); } }
		 */
    	
    	model.addAttribute("dogList", list);

        return "/disease/dog";
    }
    
    // 반려견 증상을 선택 => 해당되는 세부 증상 나열
    @GetMapping(value="/dog/detail")
    public String selectDogDisease(@RequestParam("select") String select, Model model) throws Exception {
    	
    	model.addAttribute("dogList", diseaseService.selectDogDesease(select));
    	
    	return "/disease/dogDetail";
    }
    
    // 모든 증상 선택 => 증상명과 설명 정보 제공
    @GetMapping(value="/dog/detail/symptomName")
    public String symptomName(@RequestParam("select") String select, Model model) throws Exception {
    	DogDetailDisease detailDisease = new DogDetailDisease();
    	detailDisease = diseaseService.symptomName(select);
    	System.out.println(detailDisease.getDiseaseName());
    	System.out.println(detailDisease.getTreatment());
    	
    	//model.addAttribute();
    	
    	return "";
    }
    
    
    
    
}
