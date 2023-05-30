package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Dictionary;
import com.example.demo.repository.DictionaryRepository;

@Service
public class DictionaryServiceImpl implements DictionaryService {

	
	private final DictionaryRepository dictionaryRepository;
	
	@Autowired
	public DictionaryServiceImpl(DictionaryRepository dictionaryRepository) {
		this.dictionaryRepository = dictionaryRepository;
	}

	@Override
	public List<Dictionary> findAllPost() throws Exception {
		return dictionaryRepository.findAllPost();
	}

	@Override
	public Dictionary findPost(int idx) throws Exception {
		return dictionaryRepository.findPost(idx);
	}

	public void insert(Dictionary dictionary) throws Exception {
		dictionaryRepository.insert(dictionary);
	}
}
