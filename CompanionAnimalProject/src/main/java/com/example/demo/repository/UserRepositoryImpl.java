package com.example.demo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.example.demo.model.User;

@Repository
public class UserRepositoryImpl implements UserRepository{
	
	private final JdbcTemplate jdbcTemplate;
	
   @Autowired
   public UserRepositoryImpl(JdbcTemplate jdbcTemplate) {
       this.jdbcTemplate = jdbcTemplate;
   }

   @Override
   public User save(User user) {
       SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
       jdbcInsert.withTableName("User").usingGeneratedKeyColumns("id");

       Map<String, Object> parameters = new HashMap<>();
       parameters.put("name", user.getName());

       Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameters));
       user.setId(key.toString());

       return user;
   }

   @Override
   public List<User> findAll() {
       return jdbcTemplate.query("select * from User", userRowMapper());
   }

   @Override
   public Optional<User> findByName(String name) {
       List<User> result = jdbcTemplate.query("select * from User where name = ?", userRowMapper(), name);
       return result.stream().findAny();
   }

   private RowMapper<User> userRowMapper() {
       return new RowMapper<User>() {
           @Override
           public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        	   User user = new User();
        	   user.setId(rs.getString("id"));
        	   user.setName(rs.getString("name"));
        	   user.setPhone(rs.getString("phone"));
               return user;
           }
       };
   }
}
