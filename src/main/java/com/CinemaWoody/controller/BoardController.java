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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService bService;

    // 고객센터 게시판 만들기
    @GetMapping("/list/{curPage}")
    public String list(@PathVariable("curPage") int curPage, PageTO<BoardDTO> pt, Model model) {

        pt.setCurPage(curPage);

        model.addAttribute("pt", pt);

        return "board/list";

    }

    @GetMapping("/list")
    public void list(PageTO<BoardDTO> pt, Model model) {
        pt = bService.list(pt);

        model.addAttribute("pt", pt);
    }

    // 글쓰기 화면으로 갈 때 로그인 되어있는 회원 정보 가져가야함(작성자때문)
    @GetMapping("/insertui")
    public String insertUi(HttpServletRequest request) {

        return "board/insert";
    }

    @PostMapping("/insert")
    public String insert(BoardDTO dto) {

        bService.insert(dto);

        dto.getRegDate().substring(0, 10);

        return "redirect:/board/read/" + dto.getBno();
    }
}
