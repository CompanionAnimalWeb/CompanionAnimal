package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.User;

public interface UserRepository {
	
    List<User> findAll();
    public void insert(User user);
    public User selectUser(User user) throws Exception;
    public User selectByUserId(String id) throws Exception;
    public void modify(User user) throws Exception;
    public void delete(User user) throws Exception;
    public User findId(User user) throws Exception;
    	
}
