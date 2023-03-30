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
       return jdbcTemplate.query("select category, name, latitude, longitude from Service", placeRowMapper());
   }
   
   //Place 정보를 매핑하는 RowMapper
   private RowMapper<Place> placeRowMapper() {
	   System.out.println("RowMapper 실행");
	    return (rs, rowNum) -> {
	    	Place place = new Place();
	    	place.setCategory(rs.getString("category"));
	    	place.setName(rs.getString("name"));
	    	place.setLatitude(rs.getDouble("latitude"));
	    	place.setLongitude(rs.getDouble("longitude"));
	    	System.out.println(place.getName());
	        return place;
	    };
	}

}
