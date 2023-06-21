package com.example.demo.repository;

import java.util.List;

public interface DiseaseRepository {
	
	List<?> diseaseList() throws Exception;
    List<?> selectDisease(String select) throws Exception;
    List<?> diseaseName(String[] values) throws Exception;
}
