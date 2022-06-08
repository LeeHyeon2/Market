package com.its.market.repository;

import com.its.market.dto.BoardDTO;
import com.its.market.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    public SqlSessionTemplate sql;

    public void save(BoardDTO boardDTO) {
        sql.insert("Board.save",boardDTO);
    }

    public List<BoardDTO> findByList(Object id) {
        return sql.selectList("Board.findByList",id);
    }

    public BoardDTO findById(int id) {
        sql.update("Board.hits",id);
        return sql.selectOne("Board.findById",id);
    }

    public void delete(int id) {
        sql.delete("Board.delete",id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }


    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }


    public int boardCount() {
        return sql.selectOne("Board.count");
    }
}
