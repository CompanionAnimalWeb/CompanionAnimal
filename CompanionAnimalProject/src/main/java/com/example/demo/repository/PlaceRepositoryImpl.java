package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
   public List<Place> findCoffee() {
       return findPlacesByCategory("카페");
   }

   @Override
   public List<Place> findStore() {
       return findPlacesByCategory("마트");
   }

   @Override
   public List<Place> findPark() {
       return findPlacesByCategory("공원");
   }

   @Override
   public List<Place> findRestaurant() {
       return findPlacesByCategory("식당");
   }

   @Override
   public List<Place> findHotel() {
       return findPlacesByCategory("호텔");
   }

   @Override
   public List<Place> findHospital() {
       return findPlacesByCategory("병원");
   }

   @Override
   public List<Place> findSalon() {
       return findPlacesByCategory("미용실");
   }

   @Override
   public Optional<Place> getMarkerDetail(long serviceIdx) {
       String query = "SELECT * FROM Service WHERE service_idx = ?";
       try {
           Place place = jdbcTemplate.queryForObject(query, placeRowMapper(), serviceIdx);
           return Optional.ofNullable(place);
       } catch (EmptyResultDataAccessException e) {
           return Optional.empty();
       }
   }


   //쿼리문 동적으로 생성하기
   private List<Place> findPlacesByCategory(String category) {
       String query = "SELECT * FROM Service" + (category != null ? " WHERE category = ?" : "");
       Object[] params = category != null ? new Object[]{category} : new Object[]{};
       return jdbcTemplate.query(query, params, placeRowMapper());
   }

   //Place 정보를 매핑하는 RowMapper
   private RowMapper<Place> placeRowMapper() {
       return (rs, rowNum) -> {
           Place place = new Place();
           place.setService_idx(rs.getLong("service_idx"));
           place.setCategory(rs.getString("category"));
           place.setName(rs.getString("name"));
           place.setAddress(rs.getString("address"));
           place.setHours(rs.getString("hours"));
           place.setTel(rs.getString("tel"));
           place.setComment(rs.getString("comment"));
           place.setLatitude(rs.getDouble("latitude"));
           place.setLongitude(rs.getDouble("longitude"));
           place.setImagePath(rs.getString("image_path"));
           return place;
       };
   }

}


