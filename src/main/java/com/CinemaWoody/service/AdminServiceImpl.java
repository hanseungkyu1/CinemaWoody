package com.CinemaWoody.service;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.MovieDTO;
import com.CinemaWoody.domain.PageTO;
import com.CinemaWoody.repository.AdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDAO aDAO;

    @Override
    public PageTO<MovieDTO> listMovie(PageTO<MovieDTO> pt) {
        int amount = aDAO.getAmount();
        pt.setAmount(amount);

        List<MovieDTO> list = aDAO.listMovie(pt);
        pt.setList(list);

        return pt;
    }

    @Override
    public void insertMovie(MovieDTO dto) {
        aDAO.insertMovie(dto);
    }
}
