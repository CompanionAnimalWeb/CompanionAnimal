package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    	
    	//System.out.println(diseaseService.dogDeseaseList().get(0).getMainSymptom());
    	List<DogDisease> list = diseaseService.dogDeseaseList();
    	
    	// 이렇게 뽑으면 카테고리 하나당 여러개의 질병 나열할 수 있습니당
    	for(int i =0; i < list.size(); i++) {
    		System.out.println(list.get(i).getDiseaseCategory());
    		String input = list.get(i).getMainSymptom();
    		String[] elements = input.split(",");

    		for (String element : elements) {
    		    System.out.println(element.trim());
    		}
    	}

        return "";
    }
    
    
}
