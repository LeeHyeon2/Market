package com.its.market.repository;

import com.its.market.dto.TradeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TradeRepository {
    @Autowired
    public SqlSessionTemplate sql;
    public void trade(TradeDTO tradeDTO, int boardId) {
        sql.insert("Trade.trade",tradeDTO);
        sql.update("Board.trading",boardId);
    }

    public TradeDTO findById(int id) {
        return sql.selectOne("Trade.findById",id);
    }

    public void success(int id) {
        sql.update("Trade.success",id);
        sql.update("Board.success",id);
        sql.delete("Bag.success",id);
    }

    public void fail(int id) {
        sql.update("Trade.fail",id);
        sql.update("Board.fail",id);
    }

    public List<TradeDTO> myPage(Object id) {
        return sql.selectList("Trade.myPage",id);
    }
}
