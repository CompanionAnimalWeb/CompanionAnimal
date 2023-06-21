package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Place;
import com.example.demo.repository.PlaceRepository;

@Service
public interface PlaceService {
    // 카페의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findCoffees();

    // 가게의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findStores();

    // 공원의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findParks();
    
    // 식당의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findRestaurants();
    
    // 호텔의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findHotels();
    
    // 병원의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findHospitals();
    
    // 미용실의 category, name, latitude, address, longitude 정보를 리턴
    public List<Place> findSalons();
    
    //자세히보기 클릭시 해당 장소의 상세 정보 리턴
    public Optional<Place> getMarkerDetails(long serviceIdx);
}
