package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;
import com.example.demo.repository.PlaceRepository;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService{
	
	private final PlaceRepository placeRepository;

    @Autowired
    public PlaceServiceImpl(PlaceRepository placeRepository) {
        this.placeRepository = placeRepository;
    }

    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findPlaces(){
        return placeRepository.findAll();
    }
    
    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findCoffees(){
        return placeRepository.findCoffee();
    }
    
    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findStores(){
        return placeRepository.findStore();
    }
    
    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findParks(){
        return placeRepository.findPark();
    }
}
