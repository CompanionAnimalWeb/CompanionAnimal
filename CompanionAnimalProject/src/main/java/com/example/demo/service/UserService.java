package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MemberJoinController;
import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {
	
	private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // 전체 회원의 id, name, phone 정보를 리턴
    public List<User> findUsers(){
        return userRepository.findAll();
    }
    
    // 회원 데이터 입력을 위한 메소드
    public void insert(MemberJoinController mjc) {
    	userRepository.insert(mjc);
    }
    
	public User selectUser(User user) throws Exception {
		return userRepository.selectUser(user);
	}
	
	public User selectUserById(String id) {
		System.out.println("select ");
		return userRepository.selectUserById(id);
	}
	
	public int insertUser(User user) {
		System.out.println("서비스 메서드");
		return userRepository.insertUser(user);
	}
	
}
