package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService mService;

    // 회원가입 화면
    @GetMapping("/insert")
    public void insertUI() {

    }

    // 회원가입
    @PostMapping("/insert")
    public String insertMember(MemberDTO dto) {
        mService.insertMember(dto);

        return "redirect:/";
    }

    // produces : controller에서 jsp ajax부분으로 문자열 넘겨줄 때 깨지는 현상 해결
    @PostMapping(value = "/midCheck", produces = "application/text; charset=utf8")
    @ResponseBody
    public String midCheck(String mid) {
        MemberDTO dto = mService.midCheck(mid);

        if (dto == null) {
            return "사용 가능한 아이디입니다.";
        } else {
            return "사용 불가능한 아이디입니다.";
        }

    }
}
