package com.example.demo.repository;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public abstract class AbstractDiseaseRepository implements DiseaseRepository {
	
    protected final JdbcTemplate jdbcTemplate;
    
    @Autowired
    public AbstractDiseaseRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    protected abstract RowMapper<?> diseaseRowMapper();
    protected abstract RowMapper<?> detailDiseaseRowMapper();
    protected abstract RowMapper<?> diseaseNameRowMapper();

    //증상 리스트
    @Override
    public List<?> diseaseList() throws Exception {
        // 공통 로직
        String sql = "SELECT disease_category, group_concat(main_symptom) as main_symptom FROM "
                + getDiseaseTable() + " GROUP BY disease_category ORDER BY disease_category, main_symptom";
        return jdbcTemplate.query(sql, diseaseRowMapper());
    }
    
    //세부 증상 선택
    @Override
    public List<?> selectDisease(String select) throws Exception {
        // 공통 로직
        String sql = "SELECT classfication, group_concat(detail_symptom) as detail_symptom, disease_idx FROM "
                + getDetailDiseaseTable() + " WHERE main_symptom = ? GROUP BY disease_idx, classfication ORDER BY classfication";
        return jdbcTemplate.query(sql, detailDiseaseRowMapper(), select);
    }

    //선택한 증상에 따른 증상명과 설명
    @Override
    public List<?> diseaseName(String[] values) throws Exception {
        // 공통 로직
        String sql = "SELECT disease_name, treatment FROM " + getDiseaseNameTable() + " WHERE disease_idx IN ("
                + String.join(",", Collections.nCopies(values.length, "?")) + ")";
        return jdbcTemplate.query(sql, diseaseNameRowMapper(), (Object[]) values);
    }

    protected abstract String getDiseaseTable();
    protected abstract String getDetailDiseaseTable();
    protected abstract String getDiseaseNameTable();
}
