package com.example.demo.repository;

import java.util.List;
import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;

public interface UserRepository {
    List<User> findAll();
    void insert(User user);
    public User selectUser(User user) throws Exception;
}
