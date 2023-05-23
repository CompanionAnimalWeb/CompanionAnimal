package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.DogDisease;

public interface DiseaseRepository {
	public List<DogDisease> dogDeseaseList() throws Exception;	// 반려견 증상 리스트
}
