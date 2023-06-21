package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Place;
import com.example.demo.repository.PlaceRepository;

@Service
public class PlaceServiceImpl implements PlaceService{
	
	private final PlaceRepository placeRepository;

    @Autowired
    public PlaceServiceImpl(PlaceRepository placeRepository) {
        this.placeRepository = placeRepository;
    }

    // 카페의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findCoffees(){
        System.out.println("PlaceServiceImpl.findCoffees()");
        return placeRepository.findCoffee();
    }
    
    // 가게의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findStores(){
        System.out.println("PlaceServiceImpl.findStores()");
        return placeRepository.findStore();
    }
    
    // 공원의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findParks(){
        System.out.println("PlaceServiceImpl.findParks()");
        return placeRepository.findPark();
    }
    
    // 식당의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findRestaurants(){
        System.out.println("PlaceServiceImpl.findRestaurants()");
        return placeRepository.findRestaurant();
    }
    
    // 호텔의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findHotels(){
        System.out.println("PlaceServiceImpl.findHotels()");
        return placeRepository.findHotel();
    }
    
    // 병원의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findHospitals(){
        System.out.println("PlaceServiceImpl.findHospitals()");
    	return placeRepository.findHospital();
    }
    
    // 미용실의 category, name, address, latitude, longitude 정보를 리턴
    public List<Place> findSalons(){
        System.out.println("PlaceServiceImpl.findSalons()");
    	return placeRepository.findSalon();
    }
    
    public Optional<Place> getMarkerDetails(long serviceIdx){
        System.out.println("PlaceServiceImpl.getMarkerDetails()");
    	return placeRepository.getMarkerDetail(serviceIdx);
    }
}
