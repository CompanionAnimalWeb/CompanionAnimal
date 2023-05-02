package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // 전체 회원의 id, name, phone 정보를 리턴
    @Override
    public List<User> findUsers(){
        return userRepository.findAll();
    }
    
    //회원 데이터 입력을 위한 메서드
    @Override
    public void insert(User user) {
    	userRepository.insert(user);
    }

	@Override
	public User selectUser(User user) throws Exception {
		return userRepository.selectUser(user);
	}
	@Override
	public User selectByUserId(String id) throws Exception{
		return userRepository.selectByUserId(id);
	}
	
}
