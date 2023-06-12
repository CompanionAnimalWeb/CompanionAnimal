package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CatDiseaseRepository;
import com.example.demo.repository.DogDiseaseRepository;

@Service
public class DiseaseServiceImpl implements DiseaseService{
	
	private final DogDiseaseRepository dogDiseaseRepository;
	private final CatDiseaseRepository catDiseaseRepository;

    @Autowired
    public DiseaseServiceImpl(DogDiseaseRepository dogDiseaseRepository, CatDiseaseRepository catDiseaseRepository) {
        this.dogDiseaseRepository = dogDiseaseRepository;
        this.catDiseaseRepository = catDiseaseRepository;
    }
    
    /*반려견 관련*/
    @Override
	public List<?> dogDiseaseList() throws Exception {
		return dogDiseaseRepository.diseaseList();
	}
	
	public List<?> selectDogDisease(String select) throws Exception {
		return dogDiseaseRepository.selectDisease(select);
	}
	
	public List<?> dogDiseaseName(String[] values) throws Exception {
		return dogDiseaseRepository.diseaseName(values);
	}
	
	/*반려묘 관련*/
	public List<?> catDiseaseList() throws Exception {
		return catDiseaseRepository.diseaseList();
	}
	
	public List<?> selectCatDisease(String select) throws Exception {
		return catDiseaseRepository.selectDisease(select);
	}
	
	public List<?> catDiseaseName(String[] values) throws Exception {
		return catDiseaseRepository.diseaseName(values);
	}
	
}
