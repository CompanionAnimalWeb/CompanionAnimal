package com.example.demo.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;

@Repository
public class UserRepositoryImpl implements UserRepository{
	
   private final JdbcTemplate jdbcTemplate;
	
   @Autowired
   public UserRepositoryImpl(JdbcTemplate jdbcTemplate) {
       this.jdbcTemplate = jdbcTemplate;
   }

   //User의 id, name, phone 정보를 가져오기 위한 메서드
   //RowMapper를 사용해서 매핑
   @Override
   public List<User> findAll() {
	   System.out.println("findAll 메서드 실행");
       return jdbcTemplate.query("select id, name, phone from User", userRowMapper());
   }
   
   //데이터 저장을 위한 insert
   @Override
   public void insert(MemberJoinController mjc) {
	   System.out.println("insert 메서드 실행");
	   String sql = "insert into User values(?,?,?,?)";
	   int result = jdbcTemplate.update(sql,mjc.getInputId(),mjc.getInputPW(),mjc.getInputName(),mjc.getInputPhone());
	   System.out.println(result + "개 행 삽입성공");
   }

   //User 정보를 매핑하는 RowMapper
   private RowMapper<User> userRowMapper() {
	   System.out.println("userRowMapper 메서드 실행");
	    return (rs, rowNum) -> {
	    	User user = new User();
	    	user.setId(rs.getString("id"));
	    	user.setName(rs.getString("name"));
	    	user.setPhone(rs.getString("phone"));
	    	System.out.println(user.getId());
	        return user;
	    };
	}
}
