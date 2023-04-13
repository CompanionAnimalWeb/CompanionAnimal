package com.example.demo.repository;

import java.util.List;
import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;

public interface UserRepository {
    List<User> findAll();
    void insert(MemberJoinController memberJoinController);
    public User selectUser(User user) throws Exception;
    public User selectUserById(String id);
    public int insertUser(User user);
}
