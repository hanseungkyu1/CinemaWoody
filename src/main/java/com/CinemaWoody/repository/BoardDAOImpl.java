package com.CinemaWoody.repository;

import com.CinemaWoody.domain.BoardDTO;
import com.CinemaWoody.domain.PageTO;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO{

    @Autowired
    private SqlSession sqlSession;

    private String NS = "com.CinemaWoody.member";


    @Override
    public List<BoardDTO> list(PageTO<BoardDTO> pt) {

        RowBounds rbs = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());

        return sqlSession.selectList(NS + ".list", null, rbs);
    }

    @Override
    public int getAmount() {
        return sqlSession.selectOne(NS + ".getAmount");
    }

    @Override
    public void insert(BoardDTO dto) {
        sqlSession.insert(NS + ".insert", dto);
    }

    @Override
    public int increaseViewCnt(int bno) {
        return sqlSession.update(NS + ".increaseViewCnt", bno);
    }

    @Override
    public BoardDTO read(int bno) {
        return sqlSession.selectOne(NS + ".read", bno);
    }

    @Override
    public void updateBoard(BoardDTO dto) {
        sqlSession.update(NS + ".updateBoard", dto);
    }

    @Override
    public void deleteBoard(int bno) {
        sqlSession.delete(NS + ".deleteBoard", bno);
    }

    // 조회수 증가

}
