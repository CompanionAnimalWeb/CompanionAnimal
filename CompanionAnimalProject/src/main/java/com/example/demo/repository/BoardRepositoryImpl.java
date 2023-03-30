package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;

@Repository
public class BoardRepositoryImpl implements BoardRepository{
	
   private final JdbcTemplate jdbcTemplate;
	
   @Autowired
   public BoardRepositoryImpl(JdbcTemplate jdbcTemplate) {
       this.jdbcTemplate = jdbcTemplate;
   }

   //User의 id, name, phone 정보를 가져오기 위한 메서드
   //RowMapper를 사용해서 매핑
   @Override
   public List<Board> findAll() {
	   //System.out.println("findAll 메서드 실행");
       return jdbcTemplate.query("select * from Board", boardRowMapper());
   }
   
   //데이터 저장을 위한 insert
   @Override
   public void insert(BoardController BC) {
	   System.out.println("게시물 작성 insert 메서드 실행");
	   String sql = "insert into Board(title,content,regdate,id) value(?,?,?,?)";
	   int result = jdbcTemplate.update(sql,BC.getInputTitle(),BC.getInputContent(),BC.getLegDate(),BC.getId());
	   System.out.println(result + "개 행 삽입성공");
   }
   
   //특정 게시물 정보를 가져오는 메서드
   @Override
   public List<Board> findPost(int no){
	   int boardIdx = no;
	   return jdbcTemplate.query("select * from Board where board_idx = ?",boardRowMapper(), boardIdx);
   }

   //Board 정보를 매핑하는 RowMapper
   private RowMapper<Board> boardRowMapper() {
	   //System.out.println("boardRowMapper 메서드 실행");
	    return (rs, rowNum) -> {
	    	Board board = new Board();
	    	board.setBoardIdx(rs.getInt("board_Idx"));
	    	board.setTitle(rs.getString("title"));
	    	board.setContent(rs.getString("content"));
	    	board.setRegDate(rs.getString("regdate"));
	    	board.setId(rs.getString("id"));
	    	//System.out.println(board.getId());
	        return board;
	    };
	}
}
