package com.CinemaWoody.service;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.PageTO;
import com.CinemaWoody.repository.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO bDAO;

    @Override
    public PageTO<BoardDTO> list(PageTO<BoardDTO> pt) {

        int amount = bDAO.getAmount();
        pt.setAmount(amount);

        List<BoardDTO> list = bDAO.list(pt);
        pt.setList(list);

        return pt;
    }

    @Override
    public void insert(BoardDTO dto) {
        bDAO.insert(dto);
    }

    @Override
    public int increaseViewCnt(int bno) {
        return bDAO.increaseViewCnt(bno);
    }

    @Override
    public BoardDTO read(int bno) {
        return bDAO.read(bno);
    }

    @Override
    public void updateBoard(BoardDTO dto) {
        bDAO.updateBoard(dto);
    }
}
