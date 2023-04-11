package com.example.demo.service;

import java.util.List;

import com.example.demo.model.User;

public interface UserService {
    // 전체 회원의 id, name, phone 정보를 리턴
    public List<User> findUsers();
    void insert(User user) throws Exception;
    public User selectUser(User user) throws Exception;
}
