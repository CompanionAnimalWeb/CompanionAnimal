package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.User;

@Repository
public class UserRepositoryImpl implements UserRepository {
	
	private final JdbcTemplate jdbcTemplate;
   
    @Autowired
    public UserRepositoryImpl(JdbcTemplate jdbcTemplate) {
    	this.jdbcTemplate = jdbcTemplate;
    }

    // User의 id, name, phone 정보를 가져오기 위한 메서드
    // RowMapper를 사용해서 매핑
    @Override
    public List<User> findAll() {
    	System.out.println("findAll 메서드 실행");
    	return jdbcTemplate.query("select id, name, phone from User", userRowMapperPart());
    }
   
    // 데이터 저장을 위한 insert
    @Override
    public void insert(User user) {
    	String sql = "insert into User values(?,?,?,?)";
    	int result = jdbcTemplate.update(sql, user.getId(), user.getPassword(), user.getName(), user.getPhone());
    	System.out.println(result + "개 행 삽입성공");
    }

	// id, pw에 맞는 사용자가 있는지 
   	@Override
    public User selectUser(User user) throws Exception {
   		System.out.println("selectUser");
		String sql = "select * from User where id=? and password=?";
		User result = jdbcTemplate.queryForObject(sql, userRowMapperAll(), user.getId(), user.getPassword());
		return result;
	}
   
	@Override
	public User selectByUserId(String id) throws Exception {
		String sql = "select id from User where id = ?";
		User result;
		try {
			result = jdbcTemplate.queryForObject(sql, selectByUserIdMapper(), id);
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	
	// User 정보를 매핑하는 RowMapper
	private RowMapper<User> userRowMapperPart() {
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
	   
	private RowMapper<User> userRowMapperAll() {
		System.out.println("userRowMapper 메서드 실행");
		return (rs, rowNum) -> {
			User user = new User();
			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setPhone(rs.getString("phone"));
			return user;
		};
	}
	   
	private RowMapper<User> selectByUserIdMapper() {
		System.out.println("selectByUserIdMapper 메소드 실행");
		return (rs, rowNum) -> {
			User user = new User();
			user.setId(rs.getString("id"));
			//System.out.println(user.getId());
			return user;
		};
	}
	
	public void modify(User user) {
		String sql = "update User set password = ? where id = ?";
		jdbcTemplate.update(sql, user.getPassword(), user.getId());
	}
	
	public void delete(User user) {
		String sql = "delete from User where id = ? and password = ?";
		jdbcTemplate.update(sql, user.getId(), user.getPassword());
		System.out.println("delete 메소드 실행");
	}

}
