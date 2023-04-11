package com.example.demo.service;

import java.util.List;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;

/**
 * 
 * @author Juhyeon Yeo
 * @since 2023. 4. 10. 오후 9:06:37
 *
 */
public interface BoardService {

	public List<Board> findAllBoard() throws Exception;	// 게시물 목록	
	public Board findPost(int no) throws Exception;		// 특정 게시글 가져오기
	public List<Board> findPost(String content, String title);	// 게시물 검색
	public void insert(Board board) throws Exception;	// 게시글 삽입
	public void modify(Board board) throws Exception;	// 게시글 수정
	public void delete(int bno) throws Exception;		// 게시글 삭제	
	public int count() throws Exception;				// 게시글 총 갯수
}
