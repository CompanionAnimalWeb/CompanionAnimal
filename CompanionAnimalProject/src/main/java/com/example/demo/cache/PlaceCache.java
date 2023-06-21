package com.example.demo.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.model.Place;

@Service
public class PlaceCache {
    private final Map<Long, Place> placeCache;
    private final Map<String, List<Place>> categoryCache;

    private List<Place> coffees = new ArrayList<>();
    private List<Place> stores = new ArrayList<>();
    private List<Place> parks = new ArrayList<>();
    private List<Place> restaurants = new ArrayList<>();
    private List<Place> hospitals = new ArrayList<>();
    private List<Place> hotels = new ArrayList<>();
    private List<Place> salons = new ArrayList<>();
    
    public PlaceCache() {
        this.placeCache = new HashMap<>();
        this.categoryCache = new HashMap<>();
    }

    public List<Place> getCoffees() {
        return categoryCache.getOrDefault("카페", List.of());
    }

    public void putCoffees(List<Place> coffees) {
        this.coffees = coffees; // coffees 리스트에 데이터 저장
        categoryCache.put("카페", coffees);
        for (Place coffee : coffees) {
            placeCache.put(coffee.getService_idx(), coffee);
        }
    }
    
    public boolean containsCoffees() {
        return coffees != null && !coffees.isEmpty();
    }
    
    public List<Place> getStores() {
        return categoryCache.getOrDefault("마트", List.of());
    }

    public void putStores(List<Place> stores) {
        this.stores = stores; // stores 리스트에 데이터 저장
        categoryCache.put("마트", stores);
        for (Place store : stores) {
            placeCache.put(store.getService_idx(), store);
        }
    }

    public boolean containsStores() {
        return stores != null && !stores.isEmpty();
    }
    
    public List<Place> getParks() {
        return categoryCache.getOrDefault("공원", List.of());
    }

    public void putParks(List<Place> parks) {
        this.parks = parks; // parks 리스트에 데이터 저장
        categoryCache.put("공원", parks);
        for (Place park : parks) {
            placeCache.put(park.getService_idx(), park);
        }
    }
    
    public boolean containsParks() {
        return parks != null && !parks.isEmpty();
    }
    
    public List<Place> getRestaurants() {
        return categoryCache.getOrDefault("식당", List.of());
    }

    public void putRestaurants(List<Place> restaurants) {
        this.restaurants = restaurants; // restaurants 리스트에 데이터 저장
        categoryCache.put("식당", restaurants);
        for (Place restaurant : restaurants) {
            placeCache.put(restaurant.getService_idx(), restaurant);
        }
    }

    public boolean containsRestaurants() {
        return restaurants != null && !restaurants.isEmpty();
    }
    
    public List<Place> getHotels() {
        return categoryCache.getOrDefault("호텔", List.of());
    }

    public void putHotels(List<Place> hotels) {
        this.hotels = hotels; // hotels 리스트에 데이터 저장
        categoryCache.put("호텔", hotels);
        for (Place hotel : hotels) {
            placeCache.put(hotel.getService_idx(), hotel);
        }
    }
    
    public boolean containsHotels() {
        return hotels != null && !hotels.isEmpty();
    }
    
    public List<Place> getHospitals() {
        return categoryCache.getOrDefault("병원", List.of());
    }

    public void putHospitals(List<Place> hospitals) {
        this.hospitals = hospitals; // hospitals 리스트에 데이터 저장
        categoryCache.put("병원", hospitals);
        for (Place hospital : hospitals) {
            placeCache.put(hospital.getService_idx(), hospital);
        }
    }

    public boolean containsHospitals() {
        return hospitals != null && !hospitals.isEmpty();
    }
    
    public List<Place> getSalons() {
        return categoryCache.getOrDefault("미용실", List.of());
    }

    public void putSalons(List<Place> salons) {
        this.salons = salons; // hospitals 리스트에 데이터 저장
        categoryCache.put("미용실", salons);
        for (Place salon : salons) {
            placeCache.put(salon.getService_idx(), salon);
        }
    }
    
    public boolean containsSalons() {
        return salons != null && !salons.isEmpty();
    }

    public Optional<Place> getPlace(long serviceIdx) {
        return Optional.ofNullable(placeCache.get(serviceIdx));
    }

    public void putPlace(long serviceIdx, Place place) {
        placeCache.put(serviceIdx, place);
    }
}
