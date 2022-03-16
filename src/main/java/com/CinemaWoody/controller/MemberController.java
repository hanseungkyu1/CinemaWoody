package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService mService;

    @GetMapping("/insert")
    public void insertUI() {

    }

    @PostMapping("/insert")
    public String insertMember(MemberDTO dto) {
        System.out.println(dto.getMid()+"전");
        mService.insertMember(dto);
        System.out.println("후");

        return "redirect:/";
    }
}
