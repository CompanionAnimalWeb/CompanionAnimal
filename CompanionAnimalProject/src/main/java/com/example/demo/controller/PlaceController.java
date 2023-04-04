package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Place;
import com.example.demo.service.PlaceService;

@Controller
public class PlaceController {
	
	//의존 주입
	private static PlaceService placeService;

	@Autowired
	public PlaceController(PlaceService placeService) {
		this.placeService = placeService;
	}
	
	// 동물 서비스 메인 페이지
	@RequestMapping(value = "/place/main")
	public static String placeMain(Model model) {
		//List<Place> places = placeService.findPlaces();
		List<Place> coffees = placeService.findCoffees();
		List<Place> stores = placeService.findStores();
		List<Place> parks = placeService.findParks();
		//model.addAttribute("placeList", places);
		model.addAttribute("coffeeList", coffees);
		model.addAttribute("storeList", stores);
		model.addAttribute("parkList", parks);
        return "place/main";
	}
}