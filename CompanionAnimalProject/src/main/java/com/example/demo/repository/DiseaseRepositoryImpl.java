package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;

@Repository
public class DiseaseRepositoryImpl implements DiseaseRepository{
	
	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public DiseaseRepositoryImpl(JdbcTemplate jdbcTemplate) {
	    this.jdbcTemplate = jdbcTemplate;
	}
	   
	@Override
	public List<DogDisease> dogDeseaseList() throws Exception {
		String sql = "select disease_category, group_concat(main_symptom) as main_symptom from DogDisease group by  disease_category order by disease_category, main_symptom";
		return jdbcTemplate.query(sql, DogDiseaseRowMapper());
	}
	
	@Override
	public List<String> selectDogDesease(String select) throws Exception {
		String sql = "select detail_symptom from DogDetailDisease where main_symptom = ?";
		return jdbcTemplate.queryForList(sql,String.class,select);
	}
	
	@Override
	public DogDetailDisease symptomName(String select) throws Exception {
		String sql = "select disease_name, treatment from DogDetailDisease where detail_symptom = ?";
		return jdbcTemplate.queryForObject(sql, DogDetailDiseaseRowMapper(),select);
	}
	
	
	private RowMapper<DogDisease> DogDiseaseRowMapper() {
		return (rs, rowNum) -> {
			DogDisease dogDisease = new DogDisease();
			dogDisease.setDiseaseCategory(rs.getString("disease_category"));
			dogDisease.setMainSymptom(rs.getString("main_symptom"));
		    return dogDisease;
		 };
	}
	
	private RowMapper<DogDetailDisease> DogDetailDiseaseRowMapper() {
		return (rs, rowNum) -> {
			DogDetailDisease dogDetailDisease = new DogDetailDisease();
			dogDetailDisease.setDiseaseName(rs.getString("disease_name"));
			dogDetailDisease.setTreatment(rs.getString("treatment"));
		    return dogDetailDisease;
		 };
	}
}
