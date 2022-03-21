package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService mService;

    // 회원가입 화면
    @GetMapping("/insert")
    public void insertUI() {

    }

    // 회원가입, 나중에 이메일 인증도 구현해보기
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

    // login 구현하기! 구현하면, 인강처럼 로그인 로그아웃 버튼 동적으로 변경되게도 구현, 세션과 쿠키도 이용
    @GetMapping("/login")
    public String login() {

        return "/member/login";
    }

    @PostMapping("/login")
    public String login(String mid, String pwd, boolean rememberId, HttpServletResponse response) {


        return "redirect:/";
    }
}
