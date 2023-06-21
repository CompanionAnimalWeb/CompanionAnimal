package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.cache.PlaceCache;
import com.example.demo.model.Place;

@Service("placeService")
public class PlaceServiceProxy implements PlaceService {
	private final PlaceService placeService;
	private final PlaceCache placeCache;
	
	public PlaceServiceProxy(PlaceService placeService, PlaceCache placeCache) {
		this.placeService = placeService;
		this.placeCache = placeCache;
	}

	@Override
	public List<Place> findCoffees() {
		if (placeCache.containsCoffees()) {
            System.out.println("Fetching coffee data from cache");
            return placeCache.getCoffees();
        } else {
        	System.out.println("Fetching coffee data from database");
            List<Place> coffees = placeService.findCoffees();
            placeCache.putCoffees(coffees);
            return coffees;
        }
	}

	@Override
	public List<Place> findStores() {
		if (placeCache.containsStores()) {
			System.out.println("Fetching store data from cache");
            return placeCache.getStores();
        } else {
        	System.out.println("Fetching store data from database");
            List<Place> stores = placeService.findStores();
            placeCache.putStores(stores);
            return stores;
        }
	}

	@Override
	public List<Place> findParks() {
		if (placeCache.containsParks()) {
			System.out.println("Fetching park data from cache");
            return placeCache.getParks();
        } else {
        	System.out.println("Fetching park data from database");
            List<Place> parks = placeService.findParks();
            placeCache.putParks(parks);
            return parks;
        }
	}

	@Override
	public List<Place> findRestaurants() {
		if (placeCache.containsRestaurants()) {
			System.out.println("Fetching restaurant data from cache");
            return placeCache.getRestaurants();
        } else {
        	System.out.println("Fetching restaurant data from database");
            List<Place> restaurants = placeService.findRestaurants();
            placeCache.putRestaurants(restaurants);
            return restaurants;
        }
	}

	@Override
	public List<Place> findHotels() {
		if (placeCache.containsHotels()) {
			System.out.println("Fetching hotel data from cache");
            return placeCache.getHotels();
        } else {
        	System.out.println("Fetching hotel data from database");
            List<Place> hotels = placeService.findHotels();
            placeCache.putHotels(hotels);
            return hotels;
        }
	}

	@Override
	public List<Place> findHospitals() {
		if (placeCache.containsHospitals()) {
			System.out.println("Fetching hospital data from cache");
            return placeCache.getHospitals();
        } else {
        	System.out.println("Fetching hospital data from database");
            List<Place> hospitals = placeService.findHospitals();
            placeCache.putHospitals(hospitals);
            return hospitals;
        }
	}

	@Override
	public List<Place> findSalons() {
		if (placeCache.containsSalons()) {
			System.out.println("Fetching salon data from cache");
            return placeCache.getSalons();
        } else {
        	System.out.println("Fetching salon data from database");
            List<Place> salons = placeService.findSalons();
            placeCache.putSalons(salons);
            return salons;
        }
	}

	@Override
	public Optional<Place> getMarkerDetails(long serviceIdx) {
		Logger logger = LoggerFactory.getLogger(PlaceServiceProxy.class);
		logger.info("getMarkerDetails 메서드 호출");
		
		Optional<Place> place = placeCache.getPlace(serviceIdx);
		if (place.isEmpty()) {
			place = placeService.getMarkerDetails(serviceIdx);
			place.ifPresent(p -> placeCache.putPlace(serviceIdx, p));
		}
		return place;
	}
}
