package com.example.demo.service;

import java.util.List;

public interface DiseaseService {
	
	//반려견
	public List<?> dogDiseaseList() throws Exception;	// 반려견 증상 리스트
	public List<?> selectDogDisease(String select) throws Exception;	// 선택한 카테고리에 대한 증상 리스트
	public List<?> dogDiseaseName(String[] values) throws Exception; // 질병과 설명
	
	//반려묘
	public List<?> catDiseaseList() throws Exception;	// 반려묘 증상 리스트
	public List<?> selectCatDisease(String select) throws Exception;	// 선택한 카테고리에 대한 증상 리스트
	public List<?> catDiseaseName(String[] values) throws Exception; // 질병과 설명
}
