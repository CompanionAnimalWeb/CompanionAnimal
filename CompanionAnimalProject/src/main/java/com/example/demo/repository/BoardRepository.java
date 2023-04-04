package com.example.demo.repository;

import java.util.List;

import com.example.demo.controller.BoardController;
import com.example.demo.model.Board;

public interface BoardRepository {
    List<Board> findAll();
    void insert(BoardController boardController);
    Board findPost(int no);
}
