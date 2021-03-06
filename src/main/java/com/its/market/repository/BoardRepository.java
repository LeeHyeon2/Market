package com.its.market.repository;

import com.its.market.dto.BoardDTO;
import com.its.market.dto.MemberDTO;
import com.its.market.dto.PageDTO;
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

    public List<BoardDTO> pagingCategory(BoardDTO boardDTO) {
        return sql.selectList("Board.pagingCategory", boardDTO);
    }


    public int CategoryCount(String boardCategory) {
        return sql.selectOne("Board.countCategory",boardCategory);
    }

    public List<BoardDTO> pagingSale(PageDTO pageDTO) {
        return sql.selectList("Board.pagingSale",pageDTO);
    }

    public int SaleCount(PageDTO count) {
        return sql.selectOne("Board.countSale",count);
    }

    public List<BoardDTO> findByList(Object loginMemberId) {
        return sql.selectList("Board.findByList",loginMemberId);
    }

    public BoardDTO findById1(int boardId) {
        return sql.selectOne("Board.findById",boardId);
    }

    public List<BoardDTO> searchAll(String search) {
        return sql.selectList("Board.searchAll",search);
    }

    public List<BoardDTO> search(Map<String, String> searchMap) {
        return sql.selectList("Board.search",searchMap);
    }

    public List<BoardDTO> findIndex() {
        return sql.selectList("Board.findIndex");
    }
}
