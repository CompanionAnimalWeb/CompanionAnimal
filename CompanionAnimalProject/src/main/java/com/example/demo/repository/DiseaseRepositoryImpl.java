package com.example.demo.repository;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.CatDetailDisease;
import com.example.demo.model.CatDisease;
import com.example.demo.model.DogDetailDisease;
import com.example.demo.model.DogDisease;

@Repository
public class DiseaseRepositoryImpl implements DiseaseRepository{
	
	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public DiseaseRepositoryImpl(JdbcTemplate jdbcTemplate) {
	    this.jdbcTemplate = jdbcTemplate;
	}
	
	/*반려견 관련*/
	
	//반려견 증상 리스트
	@Override
	public List<DogDisease> dogDiseaseList() throws Exception {
		String sql = "select disease_category, group_concat(main_symptom) as main_symptom from DogDisease group by  disease_category order by disease_category, main_symptom";
		return jdbcTemplate.query(sql, DogDiseaseRowMapper());
	}
	
	//세부 증상 선택
	@Override
	public List<DogDetailDisease> selectDogDisease(String select) throws Exception {
		String sql = "select classfication, group_concat(detail_symptom) as detail_symptom , disease_idx from DogDetailDisease "
					+ "where main_symptom = ? "
					+ "group by  disease_idx, classfication "
					+ "order by classfication";
		return jdbcTemplate.query(sql,dogDetailDiseaseRowMapper(),select);
	}
	
	//선택한 증상에 따른 증상명과 설명
	@Override
	public List<DogDetailDisease> dogDiseaseName(String[] values) throws Exception {
	    String sql = "SELECT disease_name, treatment FROM DogDiseaseName WHERE disease_idx IN ("
	            + String.join(",", Collections.nCopies(values.length, "?"))
	            + ")";

	    return jdbcTemplate.query(sql, dogDiseaseNameRowMapper(), (Object[]) values);
	}
	
	private RowMapper<DogDisease> DogDiseaseRowMapper() {
		return (rs, rowNum) -> {
			DogDisease dogDisease = new DogDisease();
			dogDisease.setDiseaseCategory(rs.getString("disease_category"));
			dogDisease.setMainSymptom(rs.getString("main_symptom"));
		    return dogDisease;
		 };
	}
	
	private RowMapper<DogDetailDisease> dogDetailDiseaseRowMapper() {
		return (rs, rowNum) -> {
			DogDetailDisease dogDetailDisease = new DogDetailDisease();
			dogDetailDisease.setClassification(rs.getString("classfication"));
			dogDetailDisease.setDetailSymptom(rs.getString("detail_symptom"));
			dogDetailDisease.setDiseaseIdx(rs.getInt("disease_idx"));
			return dogDetailDisease;
		};
	}
	
	private RowMapper<DogDetailDisease> dogDiseaseNameRowMapper() {
		return (rs, rowNum) -> {
			DogDetailDisease dogDetailDisease = new DogDetailDisease();
			dogDetailDisease.setDiseaseName(rs.getString("disease_name"));
			dogDetailDisease.setTreatment(rs.getString("treatment"));
			return dogDetailDisease;
		};
	}
	
	
	/*반려묘 관련*/
	
	//반려묘 증상 리스트
	@Override
	public List<CatDisease> catDiseaseList() throws Exception {
		String sql = "select disease_category, group_concat(main_symptom) as main_symptom from CatDisease group by  disease_category order by disease_category, main_symptom";
		return jdbcTemplate.query(sql, catDiseaseRowMapper());
	}
	
	//세부 증상 선택
	@Override
	public List<CatDetailDisease> selectCatDisease(String select) throws Exception {
		String sql = "select classfication, group_concat(detail_symptom) as detail_symptom , disease_idx from CatDetailDisease "
					+ "where main_symptom = ? "
					+ "group by  disease_idx, classfication "
					+ "order by classfication";
		return jdbcTemplate.query(sql,catDetailDiseaseRowMapper(),select);
	}
	
	//선택한 증상에 따른 증상명과 설명
	@Override
	public List<CatDetailDisease> catDiseaseName(String[] values) throws Exception {
	    String sql = "SELECT disease_name, treatment FROM CatDiseaseName WHERE disease_idx IN ("
	            + String.join(",", Collections.nCopies(values.length, "?"))
	            + ")";

	    return jdbcTemplate.query(sql, catDiseaseNameRowMapper(), (Object[]) values);
	}
		
	private RowMapper<CatDisease> catDiseaseRowMapper() {
		return (rs, rowNum) -> {
			CatDisease catDisease = new CatDisease();
			catDisease.setDiseaseCategory(rs.getString("disease_category"));
			catDisease.setMainSymptom(rs.getString("main_symptom"));
			return catDisease;
		};
	}
		
	private RowMapper<CatDetailDisease> catDetailDiseaseRowMapper() {
		return (rs, rowNum) -> {
			CatDetailDisease catDetailDisease = new CatDetailDisease();
			catDetailDisease.setClassification(rs.getString("classfication"));
			catDetailDisease.setDetailSymptom(rs.getString("detail_symptom"));
			catDetailDisease.setDiseaseIdx(rs.getInt("disease_idx"));
			return catDetailDisease;
		};
	}
	
	private RowMapper<CatDetailDisease> catDiseaseNameRowMapper() {
		return (rs, rowNum) -> {
			CatDetailDisease catDetailDisease = new CatDetailDisease();
			catDetailDisease.setDiseaseName(rs.getString("disease_name"));
			catDetailDisease.setTreatment(rs.getString("treatment"));
			return catDetailDisease;
		};
	}
	
	
}
