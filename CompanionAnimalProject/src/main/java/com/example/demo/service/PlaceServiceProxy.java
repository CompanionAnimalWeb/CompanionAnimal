package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.demo.cache.PlaceCache;
import com.example.demo.model.Place;

@Service("placeService")
public class PlaceServiceProxy implements PlaceService {
	private final PlaceService placeService;
	private final PlaceCache placeCache;
	private final Logger logger = LoggerFactory.getLogger(PlaceServiceProxy.class);
	
	public PlaceServiceProxy(PlaceService placeService, PlaceCache placeCache) {
		this.placeService = placeService;
		this.placeCache = placeCache;
	}

	@Override
	public List<Place> findCoffees() {
		if (placeCache.containsCoffees()) {
            logger.info("Fetching coffee data from cache");
            return placeCache.getCoffees();
        } else {
            logger.info("Fetching coffee data from database");
            List<Place> coffees = placeService.findCoffees();
            placeCache.putCoffees(coffees);
            return coffees;
        }
	}

	@Override
	public List<Place> findStores() {
		if (placeCache.containsStores()) {
            logger.info("Fetching store data from cache");
            return placeCache.getStores();
        } else {
            logger.info("Fetching store data from database");
            List<Place> stores = placeService.findStores();
            placeCache.putCoffees(stores);
            return stores;
        }
	}

	@Override
	public List<Place> findParks() {
		if (placeCache.containsParks()) {
            logger.info("Fetching park data from cache");
            return placeCache.getParks();
        } else {
            logger.info("Fetching park data from database");
            List<Place> parks = placeService.findParks();
            placeCache.putParks(parks);
            return parks;
        }
	}

	@Override
	public List<Place> findRestaurants() {
		if (placeCache.containsRestaurants()) {
            logger.info("Fetching restaurant data from cache");
            return placeCache.getRestaurants();
        } else {
            logger.info("Fetching restaurant data from database");
            List<Place> restaurants = placeService.findRestaurants();
            placeCache.putRestaurants(restaurants);
            return restaurants;
        }
	}

	@Override
	public List<Place> findHotels() {
		if (placeCache.containsHotels()) {
            logger.info("Fetching hotel data from cache");
            return placeCache.getHotels();
        } else {
            logger.info("Fetching hotel data from database");
            List<Place> hotels = placeService.findHotels();
            placeCache.putHotels(hotels);
            return hotels;
        }
	}

	@Override
	public List<Place> findHospitals() {
		if (placeCache.containsHospitals()) {
            logger.info("Fetching hospital data from cache");
            return placeCache.getHospitals();
        } else {
            logger.info("Fetching hospital data from database");
            List<Place> hospitals = placeService.findHospitals();
            placeCache.putHospitals(hospitals);
            return hospitals;
        }
	}

	@Override
	public List<Place> findSalons() {
		if (placeCache.containsSalons()) {
            logger.info("Fetching salon data from cache");
            return placeCache.getSalons();
        } else {
            logger.info("Fetching salon data from database");
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
