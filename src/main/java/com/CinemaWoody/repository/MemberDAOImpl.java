package com.CinemaWoody.repository;

import com.CinemaWoody.domain.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    private String NS = "com.CinemaWoody.member";


    @Override
    public void insertMember(MemberDTO dto) {
        sqlSession.insert(NS + ".insertMember", dto);
    }

    @Override
    public MemberDTO midCheck(String mid) {
        return sqlSession.selectOne(NS + ".midCheck", mid);
    }

    @Override
    public void update(MemberDTO mDto) {
        sqlSession.update(NS + ".update", mDto);
    }

}
