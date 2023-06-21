package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Place;
import com.example.demo.service.PlaceService;

@Controller
public class PlaceController {
	
	//의존 주입
	private final PlaceService placeService;

	
	public PlaceController(PlaceService placeService) {
		this.placeService = placeService;
	}
	
	// 동물 서비스 메인 페이지
	@RequestMapping(value = "/place/main")
	public String placeMain(Model model) {
		List<Place> coffees = placeService.findCoffees();
		List<Place> stores = placeService.findStores();
		List<Place> parks = placeService.findParks();
		List<Place> restaurants = placeService.findRestaurants();
		List<Place> hotels = placeService.findHotels();
		List<Place> hospitals = placeService.findHospitals();
		List<Place> salons = placeService.findSalons();
		
		model.addAttribute("coffeeList", coffees);
		model.addAttribute("storeList", stores);
		model.addAttribute("parkList", parks);
		model.addAttribute("restaurantList", restaurants);
		model.addAttribute("hotelList", hotels);
		model.addAttribute("hospitalList", hospitals);
		model.addAttribute("salonList", salons);
        return "place/main";
	}
	// 장소 상세 페이지
	@RequestMapping(value = "/place/detailPlace")
	public String detailPlace(Model model, @RequestParam("Idx") long serviceIdx) {
	    Optional<Place> marker = placeService.getMarkerDetails(serviceIdx);
	    marker.ifPresent(m -> model.addAttribute("marker", m));
	    return "place/detailPlace";
	}

}