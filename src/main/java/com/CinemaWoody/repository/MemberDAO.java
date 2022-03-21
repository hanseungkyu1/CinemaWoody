package com.CinemaWoody.repository;

import com.CinemaWoody.domain.MemberDTO;

public interface MemberDAO {

    void insertMember(MemberDTO dto);

    MemberDTO midCheck(String mid);

    void update(MemberDTO mDto);
}
