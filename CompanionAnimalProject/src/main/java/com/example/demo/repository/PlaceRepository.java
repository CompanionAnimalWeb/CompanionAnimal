package com.example.demo.repository;

import java.util.List;
import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;

public interface PlaceRepository {
    List<Place> findAll();
}
