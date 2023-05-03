package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.validation.Errors;

import com.example.demo.model.User;

public interface UserService {

    public List<User> findUsers();
    void insert(User user) throws Exception;
    public User selectUser(User user) throws Exception;
	public User selectByUserId(String id) throws Exception;

}
