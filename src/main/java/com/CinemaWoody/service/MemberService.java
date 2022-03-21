package com.CinemaWoody.service;

import com.CinemaWoody.domain.MemberDTO;

public interface MemberService {

    void insertMember(MemberDTO dto);

    MemberDTO midCheck(String mid);

    void update(MemberDTO mDto);
}
