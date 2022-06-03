package com.its.market.repository;

import com.its.market.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
