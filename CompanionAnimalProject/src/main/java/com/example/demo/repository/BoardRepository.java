package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Board;
import com.example.demo.model.Criteria;

public interface BoardRepository {
	
	public List<Board> findAll() throws Exception;				// 게시물 목록	
	public Board findPost(int no) throws Exception;				// 특정 게시글 가져오기
	public List<Board> findPost(String content, String title);	// 게시물 검색
	public void insert(Board board) throws Exception;			// 게시물 삽입
	public void modify(Board board) throws Exception;			// 게시물 수정
	public void delete(int bno) throws Exception;				// 게시물 삭제
	public int countBoard() throws Exception;					// 게시물 총 갯수
	//public List<Board> selectBoard() throws Exception;
	//public List<Board> listPaging(int page) throws Exception;
	public List<Board> listCriteria(Criteria criteria) throws Exception;
}