package com.CinemaWoody.controller;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
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

        MemberDTO dto = new MemberDTO();
        dto = mService.midCheck(mid);
        HttpSession session = request.getSession();
        session.setAttribute("dto", dto);

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

    // 회원정보 수정
    // 회원정보 수정화면 들어가기전에 비밀번호 체크하는 화면 만들기
    // 회원정보 수정화면으로 들어갈 때 세션 만료되서 로그아웃 되어있으면 로그인 화면으로 이동하도록 if문 구현
    @GetMapping("/update/{mid}")
    public String update(@PathVariable("mid") String mid, Model model) {
        MemberDTO mDto = mService.midCheck(mid);

        model.addAttribute("mDto", mDto);

        return "/member/update";
    }

    @PostMapping("/update")
    public String update(MemberDTO mDto) {
        mService.update(mDto);

        return "redirect:/";
    }

    // 회원목록, 게시판 만들기
}
