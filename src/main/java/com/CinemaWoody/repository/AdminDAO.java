package com.CinemaWoody.repository;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.MovieDTO;
import com.CinemaWoody.domain.PageTO;

import java.util.List;

public interface AdminDAO {

    

    void insertMovie(MovieDTO dto);

    int getAmount();

    List<MovieDTO> listMovie(PageTO<MovieDTO> pt);
}
