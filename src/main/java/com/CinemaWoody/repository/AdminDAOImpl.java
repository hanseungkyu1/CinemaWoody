package com.CinemaWoody.repository;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.MovieDTO;
import com.CinemaWoody.domain.PageTO;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private SqlSession sqlSession;

    private String NS = "com.CinemaWoody.admin";

    @Override
    public List<MovieDTO> listMovie(PageTO<MovieDTO> pt) {

        RowBounds rbs = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());

        return sqlSession.selectList(NS + ".listMovie", null, rbs);
    }

    @Override
    public int getAmount() {
        return sqlSession.selectOne(NS + ".getAmount");
    }

    @Override
    public void insertMovie(MovieDTO dto) {
        sqlSession.insert(NS + ".insertMovie", dto);
    }
}
