package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.CatDetailDisease;
import com.example.demo.model.CatDisease;
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
    
    /*반려견 관련*/
	@Override
	public List<DogDisease> dogDiseaseList() throws Exception {
		return diseaseRepository.dogDiseaseList();
	}
	
	@Override
	public List<String> selectDogDisease(String select) throws Exception {
		return diseaseRepository.selectDogDisease(select);
	}
	
	@Override
	public DogDetailDisease symptomName(String select) throws Exception {
		return diseaseRepository.symptomName(select);
	}
	
	/*반려묘 관련*/
	@Override
	public List<CatDisease> catDiseaseList() throws Exception {
		return diseaseRepository.catDiseaseList();
	}
	
	@Override
	public List<CatDetailDisease> selectCatDisease(String select) throws Exception {
		return diseaseRepository.selectCatDisease(select);
	}
	
	@Override
	public List<CatDetailDisease> diseaseName(String[] values) throws Exception {
		return diseaseRepository.diseaseName(values);
	}
	
	
}
