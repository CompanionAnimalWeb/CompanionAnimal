package com.example.demo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;

@Repository
public class DogDiseaseRepository extends AbstractDiseaseRepository{

	@Autowired
    public DogDiseaseRepository(JdbcTemplate jdbcTemplate) {
        super(jdbcTemplate);
    }
	
    @Override
    protected RowMapper<DogDisease> diseaseRowMapper() {
        return (rs, rowNum) -> {
            DogDisease dogDisease = new DogDisease();
            dogDisease.setDiseaseCategory(rs.getString("disease_category"));
            dogDisease.setMainSymptom(rs.getString("main_symptom"));
            return dogDisease;
        };
    }

    @Override
    protected RowMapper<DogDetailDisease> detailDiseaseRowMapper() {
        return (rs, rowNum) -> {
            DogDetailDisease dogDetailDisease = new DogDetailDisease();
            dogDetailDisease.setClassification(rs.getString("classfication"));
            dogDetailDisease.setDetailSymptom(rs.getString("detail_symptom"));
            dogDetailDisease.setDiseaseIdx(rs.getInt("disease_idx"));
            return dogDetailDisease;
        };
    }

    @Override
    protected RowMapper<DogDetailDisease> diseaseNameRowMapper() {
        return (rs, rowNum) -> {
            DogDetailDisease dogDetailDisease = new DogDetailDisease();
            dogDetailDisease.setDiseaseName(rs.getString("disease_name"));
            dogDetailDisease.setTreatment(rs.getString("treatment"));
            return dogDetailDisease;
        };
    }

    @Override
    protected String getDiseaseTable() {
        return "DogDisease";
    }

    @Override
    protected String getDetailDiseaseTable() {
        return "DogDetailDisease";
    }

    @Override
    protected String getDiseaseNameTable() {
        return "DogDiseaseName";
    }
    
}
