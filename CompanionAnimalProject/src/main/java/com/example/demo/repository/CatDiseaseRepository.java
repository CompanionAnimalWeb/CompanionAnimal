package com.example.demo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.CatDetailDisease;
import com.example.demo.model.CatDisease;

@Repository
public class CatDiseaseRepository extends AbstractDiseaseRepository{

	@Autowired
    public CatDiseaseRepository(JdbcTemplate jdbcTemplate) {
        super(jdbcTemplate);
    }

	
    @Override
    protected RowMapper<CatDisease> diseaseRowMapper() {
        return (rs, rowNum) -> {
            CatDisease catDisease = new CatDisease();
            catDisease.setDiseaseCategory(rs.getString("disease_category"));
            catDisease.setMainSymptom(rs.getString("main_symptom"));
            return catDisease;
        };
    }

    @Override
    protected RowMapper<CatDetailDisease> detailDiseaseRowMapper() {
        return (rs, rowNum) -> {
            CatDetailDisease catDetailDisease = new CatDetailDisease();
            catDetailDisease.setClassification(rs.getString("classfication"));
            catDetailDisease.setDetailSymptom(rs.getString("detail_symptom"));
            catDetailDisease.setDiseaseIdx(rs.getInt("disease_idx"));
            return catDetailDisease;
        };
    }

    @Override
    protected RowMapper<CatDetailDisease> diseaseNameRowMapper() {
        return (rs, rowNum) -> {
            CatDetailDisease catDetailDisease = new CatDetailDisease();
            catDetailDisease.setDiseaseName(rs.getString("disease_name"));
            catDetailDisease.setTreatment(rs.getString("treatment"));
            return catDetailDisease;
        };
    }

    @Override
    protected String getDiseaseTable() {
        return "CatDisease";
    }

    @Override
    protected String getDetailDiseaseTable() {
        return "CatDetailDisease";
    }

    @Override
    protected String getDiseaseNameTable() {
        return "CatDiseaseName";
    }
}
    
