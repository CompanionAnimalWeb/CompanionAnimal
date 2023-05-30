package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.Board;
import com.example.demo.model.BoardImages;
import com.example.demo.model.Criteria;
import com.example.demo.model.Dictionary;

public interface DictionaryService {

	public List<Dictionary> findAllPost() throws Exception;			// 게시물 목록	
	public Dictionary findPost(int idx) throws Exception;			// 특정 게시글 
	public void insert(Dictionary dictionary) throws Exception; 	// 게시물 등록
	
}
