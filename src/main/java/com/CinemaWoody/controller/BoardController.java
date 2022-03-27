package com.CinemaWoody.controller;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.PageTO;
import com.CinemaWoody.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService bService;

    @GetMapping("/list/{curPage}")
    public String list(@PathVariable("curPage") int curPage, PageTO<BoardDTO> pt, Model model) {

        pt.setCurPage(curPage);

        pt = bService.list(pt);

        model.addAttribute("pt", pt);

        return "board/list";

    }

    @GetMapping("/insertui")
    public String insertUi() {

        return "board/insert";
    }

    @PostMapping("/insert")
    public String insert(BoardDTO dto) {

        bService.insert(dto);
        PageTO pt = new PageTO<>();
        return "redirect:/board/read/" + dto.getBno() + "/" + pt.getCurPage();
    }

    @GetMapping("/read/{bno}/{curPage}")
    public String read(@PathVariable("bno") int bno, @PathVariable("curPage") int curPage, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        BoardDTO dto = bService.read(bno);

        model.addAttribute("dto", dto);
        model.addAttribute("curPage", curPage);

        Cookie[] cookies = request.getCookies();

        // 비교를 위한 쿠키
        Cookie viewCookie = null;

        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie" + bno)) {
                    viewCookie = cookies[i];
                }
            }
        }

        if (viewCookie == null) {
            Cookie newCookie = new Cookie("cookie" + bno, "|" + bno + "|");

            response.addCookie(newCookie);

            int result = bService.increaseViewCnt(bno);

//            if (result > 0) {
//
//            }

            return "board/read";
        }

        return "board/read";
    }

    @GetMapping("/update/{bno}/{curPage}")
    public String updateUi(@PathVariable("bno") int bno, @PathVariable("curPage") int curPage, Model model) {
        BoardDTO dto = bService.read(bno);

        model.addAttribute("dto", dto);
        model.addAttribute("curPage", curPage);

        return "board/update";
    }

    @PostMapping("/update/{bno}/{curPage}")
    public String update(@PathVariable("bno") int bno, @PathVariable("curPage") int curPage, BoardDTO dto) {
        dto.setBno(bno);

        bService.updateBoard(dto);

        return "redirect:/board/read/" + bno + "/" + curPage;
    }
}
