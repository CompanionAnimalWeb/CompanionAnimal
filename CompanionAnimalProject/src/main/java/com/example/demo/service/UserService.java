package com.example.demo.service;

import java.util.List;

import com.example.demo.model.User;

public interface UserService {

    public List<User> findUsers();
    public void insert(User user) throws Exception;
    public User selectUser(User user) throws Exception;
	public void modify(User user) throws Exception;
	public void delete(User user) throws Exception;
    public User selectByUserId(String id) throws Exception;
    public User findId(User user) throws Exception;

}
