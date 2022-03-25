package com.CinemaWoody.repository;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.PageTO;

import java.util.List;

public interface BoardDAO {

    List<BoardDTO> list(PageTO<BoardDTO> pt);

    int getAmount();

    void insert(BoardDTO dto);

    int increaseViewCnt(int bno);

    BoardDTO read(int bno);
}
