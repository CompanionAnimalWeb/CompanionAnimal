package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;
import com.example.demo.repository.BoardRepository;

@Service
public class BoardService {
	
	private final BoardRepository boardRepository;

    @Autowired
    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    // 전체 회원의 id, name, phone 정보를 리턴
    public List<Board> findAllBoard(){
        return boardRepository.findAll();
    }
    
    // 특정 게시물 정보를 가져오는 메서드
    public List<Board> findPost(int no){
        return boardRepository.findPost(no);
    }
    
    //회원 데이터 입력을 위한 메서드
    public void inset(BoardController BC) {
    	boardRepository.insert(BC);
    }
}
