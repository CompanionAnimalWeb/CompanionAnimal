package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;
import com.example.demo.model.Criteria;
import com.example.demo.repository.BoardRepository;

/**
 * 
 * @author Juhyeon Yeo
 * @since 2023. 4. 10. 오후 9:06:29
 *
 */
@Service
public class BoardServiceImpl implements BoardService{
	
	private final BoardRepository boardRepository;

    @Autowired
    public BoardServiceImpl(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    // 전체 회원의 id, name, phone 정보를 리턴
    @Override
    public List<Board> findAllBoard() throws Exception {
        return boardRepository.findAll();
    }
    
    // 특정 게시물 정보를 가져오는 메서드
    @Override
    public Board findPost(int no) throws Exception {
        return boardRepository.findPost(no);
    }
    
    /* 게시글 등록 */
    @Override
    public void insert(Board board) throws Exception {
    	boardRepository.insert(board);
    }

    
    /* 게시글 수정 */
	@Override
	public void modify(Board board) throws Exception {
		boardRepository.modify(board);
		
	}

	/* 게시글 삭제 */
	@Override
	public void delete(int bno) throws Exception {
		boardRepository.delete(bno);
		
	}

	/* 게시물 총 갯수 */
	@Override
	public int count() throws Exception {
		return boardRepository.countBoard();
	}

	/* 게시물 검색 */
	@Override
	public List<Board> findPost(String content, String title) {
		return boardRepository.findPost(content, title);
	}
	
//	@Override
//	public List<Board> listPaging(int page) throws Exception {
//		return boardRepository.listPaging(page);
//	}
	
	@Override
	public List<Board> listCriteria(Criteria criteria) throws Exception {
		return boardRepository.listCriteria(criteria);
	}
}
