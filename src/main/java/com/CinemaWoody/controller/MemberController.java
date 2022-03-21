package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.service.MemberService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLEncoder;

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

    // login
    @GetMapping("/login")
    public String login() {

        return "/member/login";
    }

    @PostMapping("/login")
    public String login(String mid, String pwd, boolean rememberId, String toUrl, HttpServletRequest request, HttpServletResponse response) {

        if (!loginCheck(mid, pwd)) {
            String msg = null;
            try {
                msg = URLEncoder.encode("ID 또는 Password가 일치하지 않습니다.", "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            return "redirect:/member/login?msg=" + msg;
        }

        HttpSession session = request.getSession();
        session.setAttribute("mid", mid);

        if (rememberId) {
            Cookie cookie = new Cookie("mid", mid);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("mid", mid);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        toUrl = toUrl == null || toUrl.equals("") ? "/" : toUrl;

        return "redirect:" + toUrl;
    }

    // id, pwd 체크
    public boolean loginCheck(String mid, String pwd) {

        MemberDTO mDto = mService.midCheck(mid);

        if (mDto == null) {
            return false;
        }

        return mDto.getPwd1().equals(pwd);
    }

    @GetMapping("/logout")
    public String logOut(HttpSession session) {
        session.invalidate();

        return "redirect:/";
    }
}
