package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.CatDetailDisease;
import com.example.demo.model.CatDisease;
import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;

public interface DiseaseRepository {
	
	// 반려견
	public List<DogDisease> dogDiseaseList() throws Exception;	// 반려견 증상 리스트
	public List<DogDetailDisease> selectDogDisease(String select) throws Exception;	// 선택한 카테고리에 대한 증상 리스트
	//public List<DogDetailDisease> dogDiseaseName(String select) throws Exception;	// 증상명과 설명
	
	// 반려묘
	public List<CatDisease> catDiseaseList() throws Exception;	// 반려묘 증상 리스트
	public List<CatDetailDisease> selectCatDisease(String select) throws Exception;	// 선택한 카테고리에 대한 증상 리스트
	public List<CatDetailDisease> catDiseaseName(String[] values) throws Exception; // 질병과 설명
	
}
