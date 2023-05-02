package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Board;
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
   
   
   /* 특정 게시물 가져오기 */
   @Override
   public Board findPost(int no){
	   int boardIdx = no;
	   return jdbcTemplate.queryForObject("select * from Board where board_idx = ?", boardRowMapper(), boardIdx);
   }
   

	@Override
	public List<Board> findPost(String content, String title) {
		
		String sql = "select * from Board where title like ? or content like ?";
		
		// SQL Injection 방지
		// content, title 부분이 ('')로 둘러쌓인 채 쿼리가 실행되므로 위험을 방지할 수 있음.
		String wrappedContent = "%" + content + "%";
		String wrappedTitle = "%" + title + "%";

		return jdbcTemplate.query(sql, boardRowMapper(), wrappedTitle, wrappedContent);
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



	
	/* 게시물 페이징 처리 */
//	@Override
//	public HashMap<String, Integer> lsitPage(Board board) throws Exception {
//		// TODO Auto-generated method stub
//		String sql = "select * from board order by board_idx desc limit ?, ?";
//		return jdbcTemplate.query
//	}
	
	
	//페이징 처리
	//게시물 총 갯수 
	@Override
	public int countBoard() throws Exception {
		String sql = "select count(*) from Board";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
//	@Override
//		public List<Board> listPaging(int page) throws Exception {
//			if (page <= 0) {
//				page=1;
//			}
//			
//			page = (page - 1) * 10;
//			
//			String sql = "select * from Board where board_idx > 0 limit ?,10";
//			
//			return jdbcTemplate.query(sql, boardRowMapper(), page);
//		}
	
	@Override
		public List<Board> listCriteria(Criteria criteria) throws Exception {
			
			String sql = "select * from Board limit ?,?";
			return jdbcTemplate.query(sql, boardRowMapper(), criteria.getPageStart(), criteria.getPerPageNum());
		}
}
