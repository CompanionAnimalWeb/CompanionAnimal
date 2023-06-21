package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.Place;

public interface PlaceRepository {
    List<Place> findAll();
    List<Place> findCoffee();
    List<Place> findStore();
    List<Place> findPark();
    List<Place> findRestaurant();
    List<Place> findHotel();
    List<Place> findHospital();
    List<Place> findSalon();
    Optional<Place> getMarkerDetail(long serviceIdx);
}
