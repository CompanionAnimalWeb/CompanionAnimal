package com.example.demo.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.Place;

@Repository
public class PlaceRepositoryImpl implements PlaceRepository{
	
   private final JdbcTemplate jdbcTemplate;
	
   @Autowired
   public PlaceRepositoryImpl(JdbcTemplate jdbcTemplate) {
       this.jdbcTemplate = jdbcTemplate;
   }

   //Place의 id, name, phone 정보를 가져오기 위한 메서드
   //RowMapper를 사용해서 매핑
   @Override
   public List<Place> findAll() {
	   System.out.println("findAll 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service", placeRowMapper());
   }
   
   @Override
   public List<Place> findCoffee() {
	   System.out.println("findCoffee 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='카페'", placeRowMapper());
   }
   
   @Override
   public List<Place> findStore() {
	   System.out.println("findStore 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='마트'", placeRowMapper());
   }
   
   @Override
   public List<Place> findPark() {
	   System.out.println("findPark 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='공원'", placeRowMapper());
   }
   
   @Override
   public List<Place> findRestaurant() {
	   System.out.println("findRestaurant 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='식당'", placeRowMapper());
   }

   @Override
   public List<Place> findHotel() {
	   System.out.println("findHotel 메서드 실행");
       return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='호텔'", placeRowMapper());
   }

   @Override
   public List<Place> findHospital() {
	   System.out.println("findHospital 메서드 실행");
	   return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='병원'", placeRowMapper());
   }
   
   @Override
   public List<Place> findSalon() {
	   System.out.println("findSalon 메서드 실행");
	   return jdbcTemplate.query("select category, name, address, latitude, longitude from Service where category='미용실'", placeRowMapper());
   }
   
   //Place 정보를 매핑하는 RowMapper
   private RowMapper<Place> placeRowMapper() {
	   System.out.println("RowMapper 실행");
	    return (rs, rowNum) -> {
	    	Place place = new Place();
	    	place.setCategory(rs.getString("category"));
	    	place.setName(rs.getString("name"));
	    	place.setAddress(rs.getString("address"));
	    	place.setLatitude(rs.getDouble("latitude"));
	    	place.setLongitude(rs.getDouble("longitude"));
	    	System.out.println(place.getName());
	    	System.out.println(place.getCategory());
	        return place;
	    };
	}

}
