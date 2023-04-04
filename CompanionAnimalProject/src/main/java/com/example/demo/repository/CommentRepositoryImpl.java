package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Board;
import com.example.demo.model.Comment;

@Repository
public class CommentRepositoryImpl implements CommentRepository{
	
	   private final JdbcTemplate jdbcTemplate;
		
	   @Autowired
	   public CommentRepositoryImpl(JdbcTemplate jdbcTemplate) {
	       this.jdbcTemplate = jdbcTemplate;
	   }

	
	   //게시물 번호에 해당하는 Comment의 모든 내용을 가져오는 메서드
	   //RowMapper를 통해 매핑
	   @Override
	   public List<Comment> findComment(int no){
		   int boardIdx = no;
		   return jdbcTemplate.query("select * from Comment where board_idx = ?",commentRowMapper(), boardIdx);
	   }
	   
	   //Comment 정보를 매핑하는 RowMapper
	   private RowMapper<Comment> commentRowMapper() {
		    return (rs, rowNum) -> {
		    	Comment comment = new Comment();
		    	comment.setCommentIdx(rs.getInt("comment_idx"));
		    	comment.setId(rs.getString("id"));
		    	comment.setContent(rs.getString("content"));
		    	//comment.setRegDate(rs.getString("regdate"));   
		    	//위에 날짜 db에 칼럼명 오류나서 나중에 수정하겠움 기능은 이상없음
		    	//System.out.println(board.getId());
		        return comment;
		    };
		}
}
