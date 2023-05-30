package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Dictionary;


@Repository
public class DictionaryRepositoryImpl implements DictionaryRepository {

	
	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public DictionaryRepositoryImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	   
	   
	@Override
	public List<Dictionary> findAllPost() throws Exception {
		return jdbcTemplate.query("select * from TB_DICTIONARY", DictionaryRowMapper());
	}


	@Override
	public Dictionary findPost(int idx) throws Exception {
		int content_idx = idx;
		return jdbcTemplate.queryForObject("select * from TB_DICTIONARY where content_idx = ?", DictionaryRowMapper(), content_idx);
	}
	
	
	/* 게시글 등록 */
	@Override
	public void insert(Dictionary dictionary) {
		String sql = "insert into TB_DICTIONARY values(?,?,?)";
		jdbcTemplate.update(sql, dictionary.getContent_idx(), dictionary.getContent_title(), dictionary.getContent_item());
	}


	// RowMapper
	private RowMapper<Dictionary> DictionaryRowMapper() {
		return (rs, rowNum) -> {
			Dictionary dictionary = new Dictionary();
			
			dictionary.setContent_idx(rs.getInt("content_idx"));
			dictionary.setContent_title(rs.getString("content_title"));
			dictionary.setContent_item(rs.getString("content_item"));
			return dictionary;
		};
	}
}
