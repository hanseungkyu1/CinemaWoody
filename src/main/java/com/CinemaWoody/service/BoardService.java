package com.CinemaWoody.service;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.PageTO;

public interface BoardService {

    PageTO<BoardDTO> list(PageTO<BoardDTO> pt);

    void insert(BoardDTO dto);

    int increaseViewCnt(int bno);

    BoardDTO read(int bno);
}
