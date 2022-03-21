package com.CinemaWoody.service;

import com.CinemaWoody.domain.MemberDTO;
import com.CinemaWoody.repository.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO mDAO;

    @Override
    public void insertMember(MemberDTO dto) {
        mDAO.insertMember(dto);
    }

    @Override
    public MemberDTO midCheck(String mid) {
        return mDAO.midCheck(mid);
    }

}
