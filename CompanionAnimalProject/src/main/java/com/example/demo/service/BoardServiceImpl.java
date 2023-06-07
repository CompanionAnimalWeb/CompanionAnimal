package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Board;
import com.example.demo.model.BoardImages;
import com.example.demo.model.Criteria;
import com.example.demo.repository.BoardRepository;

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
    
    // 특정 게시물에 대한 이미지를 가져오는 메서드
    @Override
    public Optional<String> findImages(int no) throws Exception {
        return boardRepository.findImages(no);
    }
    
    /* 게시글 등록 */
    @Override
    public void insert(Board board) throws Exception {
    	boardRepository.insert(board);
    }
    
    /* 게시글 이미지 등록 */
    @Override
    public void insertImages(BoardImages boardImages) throws Exception {
    	boardRepository.insertImages(boardImages);
    }
    
    /* 가장 최근에 추가된 게시물*/
    @Override
    public Board lastBoard() throws Exception {
    	return boardRepository.lastBoard();
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
	public List<Board> findPost(String id, String title) {
		return boardRepository.findPost(id, title);
	}
	
	@Override
	public List<Board> listCriteria(Criteria criteria) throws Exception {
		return boardRepository.listCriteria(criteria);
	}
	
	public List<Board> selectByUserId(String id) throws Exception {
		return boardRepository.selectByUserId(id);
	}
}
