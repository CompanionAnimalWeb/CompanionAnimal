package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;
import com.example.demo.repository.PlaceRepository;

@Service
public interface PlaceService {
    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findPlaces();

    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findCoffees();

    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findStores();

    // 전체 장소의 category, name, latitude, longitude 정보를 리턴
    public List<Place> findParks();
}