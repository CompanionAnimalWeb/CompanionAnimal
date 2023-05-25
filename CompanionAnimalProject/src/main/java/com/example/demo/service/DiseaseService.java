package com.example.demo.service;

import java.util.List;

import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;

public interface DiseaseService {
	public List<DogDisease> dogDeseaseList() throws Exception;	// 반려견 증상 리스트
	public List<String> selectDogDesease(String select) throws Exception;	// 선택한 카테고리에 대한 증상 리스트
	public DogDetailDisease symptomName(String select) throws Exception;	// 증상명과 설명
}
