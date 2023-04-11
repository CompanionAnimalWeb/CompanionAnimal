package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;
import com.example.demo.model.Comment;

/**
 * 
 * @author Juhyeon Yeo
 * @since 2023. 4. 10. 오후 4:19:24
 *
 */

@Repository
public class CommentRepositoryImpl implements CommentRepository{
	
	
	   private final JdbcTemplate jdbcTemplate;
		
	   @Autowired
	   public CommentRepositoryImpl(JdbcTemplate jdbcTemplate) {
	       this.jdbcTemplate = jdbcTemplate;
	   }

	   /* 댓글 조회 */ 
	   @Override
	   public List<Comment> findComment(int bno) throws Exception {
		   int boardIdx = bno;
		   return jdbcTemplate.query("select * from Comment where board_idx = ?",commentRowMapper(), boardIdx);
	   }
	   
	   //Comment 정보를 매핑하는 RowMapper
	   private RowMapper<Comment> commentRowMapper() {
		    return (rs, rowNum) -> {
		    	Comment comment = new Comment();
		    	comment.setCommentIdx(rs.getInt("comment_idx"));
		    	comment.setWriter(rs.getString("writer"));
		    	comment.setContent(rs.getString("content"));
		    	comment.setRegDate(rs.getString("regDate"));   
		    	//위에 날짜 db에 칼럼명 오류나서 나중에 수정하겠움 기능은 이상없음
		    	//System.out.println(board.getId());
		        return comment;
		    };
		}
	   
	   /* 댓글 작성 */ 
	   @Override
	   public void insert(Comment comment) throws Exception {
		   String sql = "insert into comment(comment_idx, board_idx, writer, content, regDate) value(?,?,?,?,?)";
		   jdbcTemplate.update(sql, comment.getCommentIdx(), comment.getBoardIdx(), comment.getWriter(), comment.getContent(), comment.getRegDate());
	   }
	   
	   /* 댓글 삭제 */ 
	   public void delete(int commentIdx, int boardIdx) throws Exception {
		   jdbcTemplate.update("delete from comment where comment_idx = ? and board_idx = ?", commentIdx, boardIdx);
	   }
	   
	   /* 댓글 수정 */ 
	   public void modify(Comment comment) throws Exception {
		   jdbcTemplate.update("update comment set content = ? where comment_idx = ? and board_idx = ?", comment.getContent(), comment.getCommentIdx(), comment.getBoardIdx());
	   }



	   
	   
}