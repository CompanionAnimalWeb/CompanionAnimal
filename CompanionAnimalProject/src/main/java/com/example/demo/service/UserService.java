package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Create) 회원가입
     * @param member 회원 가입할 Member 객체
     * @return 가입 성공한 회원의 ID
     */
    public String join(User user){
    	userRepository.save(user);
        return user.getId();
    }

    /**
     * Read) 전체 회원 조회
     * @return List<Member> 전체 회원 목록
     */
    public List<User> findMembers(){
        return userRepository.findAll();
    }

    /**
     * Read) 특정 회원 조회
     * @param name 회원 이름
     * @return Optional<Member> 이름이 name인 회원의 데이터
     */
    public Optional<User> findOneMember(String name) {
        return userRepository.findByName(name);
    }
}
