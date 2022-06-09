package com.its.market.service;

import com.its.market.dto.BagDTO;
import com.its.market.dto.PageDTO;
import com.its.market.repository.BagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BagService {
    @Autowired
    public BagRepository bagRepository;


    public BagDTO findById(BagDTO bagDTO) {
        return bagRepository.findById(bagDTO);
    }

    public void update(BagDTO bagDTO) {
        bagRepository.update(bagDTO);
    }

    public void delete(BagDTO bagDTO) {
        bagRepository.delete(bagDTO);
    }

    public int myBag(Object loginMemberId) {
        return bagRepository.myBag(loginMemberId);
    }

    public List<BagDTO> findList(Object loginMemberId) {
        return bagRepository.findList(loginMemberId);
    }

    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 페이지 버튼의 갯수
    public PageDTO pageMyBag(int page,int size) {
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
