package com.example.demo.service;

import java.util.List;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;

public interface UserService {

	public List<User> findUsers();
	public void inset(MemberJoinController mjc);
}
