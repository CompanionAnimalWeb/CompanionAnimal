package com.example.demo.repository;

import java.util.List;
import java.util.Optional;
import com.example.demo.model.User;

public interface UserRepository {
	User save(User user);
    List<User> findAll();
    Optional<User> findByName(String name);
}
