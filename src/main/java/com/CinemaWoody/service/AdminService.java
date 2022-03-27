package com.CinemaWoody.service;

import com.CinemaWoody.domain.MovieDTO;
import com.CinemaWoody.domain.PageTO;

public interface AdminService {

    PageTO<MovieDTO> listMovie(PageTO<MovieDTO> pt);

    void insertMovie(MovieDTO dto);
}
