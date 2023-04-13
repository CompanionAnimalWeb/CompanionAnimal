package com.example.demo.repository;

import java.util.List;
import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;

public interface PlaceRepository {
    List<Place> findAll();
    List<Place> findCoffee();
    List<Place> findStore();
    List<Place> findPark();
    List<Place> findRestaurant();
    List<Place> findHotel();
}
