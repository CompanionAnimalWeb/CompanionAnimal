package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Board;
import com.example.demo.model.BoardImages;
import com.example.demo.model.Criteria;

@Repository
public class BoardRepositoryImpl implements BoardRepository{
	
   private final JdbcTemplate jdbcTemplate;
	
   @Autowired
   public BoardRepositoryImpl(JdbcTemplate jdbcTemplate) {
       this.jdbcTemplate = jdbcTemplate;
   }

   /* 게시글 조회 */
   @Override
   public List<Board> findAll() {
	   //System.out.println("findAll 메서드 실행");
       return jdbcTemplate.query("select * from Board", boardRowMapper());
   }
   
   /* 게시글 등록 */
   @Override
   public void insert(Board board) {
	   String sql = "insert into Board(title,content,regdate,id) value(?,?,?,?)";
	   jdbcTemplate.update(sql, board.getTitle(), board.getContent(), board.getRegDate(), board.getId());
   }
   
   /* 게시물 이미지 등록*/
   @Override
   public void insertImages(BoardImages boardImages) {
	   String sql = "insert into BoardImage(board_idx ,image_url) value(?,?)";
	   jdbcTemplate.update(sql, boardImages.getBoardIdx(),boardImages.getUrl());
   }
   
   /* 가장 최근에 추가된 게시물*/
   @Override
   public Board lastBoard() {
	   return jdbcTemplate.queryForObject("SELECT board_idx FROM Board ORDER BY board_idx DESC LIMIT 1",lastBoardRowMapper());
   }
   
   /* 특정 게시물 가져오기 */
   @Override
   public Board findPost(int no){
	   int boardIdx = no;
	   return jdbcTemplate.queryForObject("select * from Board where board_idx = ?", boardRowMapper(), boardIdx);
   }
   
   /* 특정 게시물에 대한 이미지 가져오기 */
   @Override
   public Optional<String> findImages(int no) {
       int boardIdx = no;
       try {
        @SuppressWarnings("deprecation")
		String imageUrl = jdbcTemplate.queryForObject(
               "SELECT image_url FROM BoardImage WHERE board_idx = ?",
               new Object[]{boardIdx},
               String.class
           );
           return Optional.ofNullable(imageUrl);
       } catch (EmptyResultDataAccessException e) {
           return Optional.empty();
       }
   }

    // 게시물 검색
	@Override
	public List<Board> findPost(String id, String title) {
		
		String sql = "select * from Board where title like ? or id like ?";
		
		// SQL Injection 방지
		// content, title 부분이 ('')로 둘러쌓인 채 쿼리가 실행되므로 위험을 방지할 수 있음.
		String wrappedId = "%" + id + "%";
		String wrappedTitle = "%" + title + "%";

		return jdbcTemplate.query(sql, boardRowMapper(), wrappedTitle, wrappedId);
	}
   

   //Board 정보를 매핑하는 RowMapper
   private RowMapper<Board> boardRowMapper() {
	   return (rs, rowNum) -> {
	    	Board board = new Board();
	    	board.setBoardIdx(rs.getInt("board_Idx"));
	    	board.setTitle(rs.getString("title"));
	    	board.setContent(rs.getString("content"));
	    	board.setRegDate(rs.getString("regdate"));
	    	board.setId(rs.getString("id"));
	    	return board;
	    };
	}
   
   //가장 최근에 추가된 Board 정보를 매핑하는 RowMapper
   private RowMapper<Board> lastBoardRowMapper() {
	   return (rs, rowNum) -> {
		   Board board = new Board();
		   board.setBoardIdx(rs.getInt("board_Idx"));
	       return board;
	    };
	}
   
   //Board 이미지 주소를 매핑하는 RowMapper
   private RowMapper<Board> findImagesRowMapper() {
	   return (rs, rowNum) -> {
		   Board board = new Board();
		   board.setImageUrl(rs.getString("image_url"));
	       return board;
	    };
	}
   
   /* 게시글 수정 */
	@Override
	public void modify(Board board) {
		String sql = "update Board set title = ?, content = ? where board_idx = ?";
		jdbcTemplate.update(sql, board.getTitle(), board.getContent(), board.getBoardIdx());
	}
	

	/* 게시글 삭제 */ 
	@Override
	public void delete(int bno) throws Exception {
		String sql = "delete from Board where board_idx = ?";
		jdbcTemplate.update(sql, bno);
	}

	
	//페이징 처리
	//게시물 총 갯수 
	@Override
	public int countBoard() throws Exception {
		String sql = "select count(*) from Board";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	@Override
		public List<Board> listCriteria(Criteria criteria) throws Exception {
			
			String sql = "select * from Board limit ?,?";
			return jdbcTemplate.query(sql, boardRowMapper(), criteria.getPageStart(), criteria.getPerPageNum());
		}
}
