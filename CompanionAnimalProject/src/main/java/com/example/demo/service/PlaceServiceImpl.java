package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;
import com.example.demo.repository.PlaceRepository;

@Service
public class PlaceServiceImpl implements PlaceService{
	
	private final PlaceRepository placeRepository;

    @Autowired
    public PlaceServiceImpl(PlaceRepository serviceRepository) {
        this.placeRepository = serviceRepository;
    }

    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findPlaces(){
        return placeRepository.findAll();
    }
}
