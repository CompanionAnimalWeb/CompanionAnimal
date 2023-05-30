package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;
import com.example.demo.repository.DiseaseRepository;

@Service
public class DiseaseServiceImpl implements DiseaseService{
	
	private final DiseaseRepository diseaseRepository;

    @Autowired
    public DiseaseServiceImpl(DiseaseRepository diseaseRepository) {
        this.diseaseRepository = diseaseRepository;
    }
    
	@Override
	public List<DogDisease> dogDeseaseList() throws Exception {
		return diseaseRepository.dogDeseaseList();
	}
	
	@Override
	public List<String> selectDogDesease(String select) throws Exception {
		return diseaseRepository.selectDogDesease(select);
	}
	
	@Override
	public DogDetailDisease symptomName(String select) throws Exception {
		return diseaseRepository.symptomName(select);
	}
	
}
