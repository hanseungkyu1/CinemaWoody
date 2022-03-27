package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MovieDTO;
import com.CinemaWoody.domain.PageTO;
import com.CinemaWoody.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService aService;

    @GetMapping("/listMovie/{curPage}")
    public String ListMovie(@PathVariable("curPage") int curPage, PageTO<MovieDTO> pt, Model model) {

        pt.setCurPage(curPage);

        pt = aService.listMovie(pt);

        model.addAttribute("pt", pt);

        return "admin/listMovie";
    }

    @GetMapping("/insertMovieUi")
    public String insertMovie() {

        return "admin/insertMovie";
    }

    // 사진 첨부 구현하기
    @PostMapping("/insertMovie")
    public String insertMovie(MovieDTO dto) {
        aService.insertMovie(dto);

        PageTO pt = new PageTO<>();

        return "redirect:/readMovie/" + dto.getmNo() + "/" + pt.getCurPage();
    }
}
