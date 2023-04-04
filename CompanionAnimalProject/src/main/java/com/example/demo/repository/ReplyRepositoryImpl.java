package com.example.demo.repository;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Reply;

@Repository
public class ReplyRepositoryImpl implements ReplyRepository{
	
	   private final JdbcTemplate jdbcTemplate;
		
	   @Autowired
	   public ReplyRepositoryImpl(JdbcTemplate jdbcTemplate) {
	       this.jdbcTemplate = jdbcTemplate;
	   }
	   
	   //댓글 번호에 해당하는 Reply의 모든 내용을 가져오는 메서드
	   //RowMapper를 통해 매핑
	   @Override
	   public List<Reply> findReply(int no){
		   int commentIdx = no;
		   return jdbcTemplate.query("select * from Reply where comment_idx = ?",replyRowMapper(), commentIdx);
	   }
	   
	   //Reply 정보를 매핑하는 RowMapper
	   private RowMapper<Reply> replyRowMapper() {
		    return (rs, rowNum) -> {
		    	Reply reply = new Reply();
		    	reply.setReplyIdx(rs.getInt("reply_idx"));
		    	reply.setId(rs.getString("id"));
		    	reply.setContent(rs.getString("content"));
		    	reply.setRegDate(rs.getString("regdate"));   
		        return reply;
		    };
		}
	   

}
