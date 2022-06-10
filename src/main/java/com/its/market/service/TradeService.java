package com.its.market.service;

import com.its.market.dto.PageDTO;
import com.its.market.dto.TradeDTO;
import com.its.market.repository.TradeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<TradeDTO> myPage(Object loginMemberId) {
        return tradeRepository.myPage(loginMemberId);
    }

    public List<TradeDTO> findAll(Object loginMemberId) {
        return tradeRepository.findAll(loginMemberId);
    }

    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 페이지 버튼의 갯수
    public PageDTO pageList(int page, int size) {
        int memberCount = size;
        int maxPage = (int)(Math.ceil((double)memberCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;

    }
}
