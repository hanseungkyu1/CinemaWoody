package com.CinemaWoody.interceptor;

import com.CinemaWoody.domain.MemberDTO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 로그인을 하는것이기 때문에 세션이 없으면 만들어줘야 함
        HttpSession session = request.getSession();
        // 어떤 키워드로 로그인을 할것인지, 보통 대문자로 LOGIN, 원래는 겟보다 셋어트리뷰트 먼저
        Object login = session.getAttribute("dto");
        if (login != null) { // 내가 로그인을 하려고 하는데 이미 다른사람이 로그인 한 상태
            session.invalidate();
            /* session.removeAttribute("login"); invalidate()나 removeAttribute("login") 둘 중 하나 사용*/
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();

        // modelAndView.getModel() 이만큼이 map임
        // controller에 model객체에 바인딩 된 정보를 modelAndView로 얻어올 수 있음
        Map<String, Object> map = modelAndView.getModel();
        MemberDTO login = (MemberDTO) map.get("dto");

        session.setAttribute("dto", login);

        String where = (String)session.getAttribute("where");

        if(where == null) { // 내가 로그인을 하고자 왔으면 where는 null이므로 로그인 후 가고자 하는 주소 적어줌
            // /member/list로 redirect
            // 핸들러에서 redirect면 인터셉터에서 뷰쪽으로 안가짐
            response.sendRedirect("/CinemaWoody/member/login");
        }else { // 다른 작업을 하다가 로그인을 할 때
            response.sendRedirect(where);
        }

    }
}