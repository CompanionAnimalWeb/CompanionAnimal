package com.example.demo.service;

import java.util.List;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;

public interface BoardService {

	public List<Board> findAllBoard();
	public Board findPost(int no);
	public void inset(BoardController BC);
}
