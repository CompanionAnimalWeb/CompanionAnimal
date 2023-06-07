package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Board;
import com.example.demo.model.Dictionary;

public interface DictionaryRepository {
	
	public List<Dictionary> findAllPost() throws Exception;			// 게시물 목록	
	public Dictionary findPost(int idx) throws Exception;			// 특정 게시글 가져오기
	public void insert(Dictionary dictionary) throws Exception; 	// 게시물 등록
		
}