package com.its.market.service;

import com.its.market.dto.TradeDTO;
import com.its.market.repository.TradeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TradeService {
    @Autowired
    public TradeRepository tradeRepository;
    public void trade(TradeDTO tradeDTO, int boardId) {
        tradeRepository.trade(tradeDTO,boardId);
    }

    public TradeDTO findById(int id) {
        return tradeRepository.findById(id);
    }

    public void success(int id) {
        tradeRepository.success(id);
    }

    public void fail(int id) {
        tradeRepository.fail(id);
    }
}
