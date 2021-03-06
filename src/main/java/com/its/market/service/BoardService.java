package com.its.market.service;

import com.its.market.dto.BoardDTO;
import com.its.market.dto.MemberDTO;
import com.its.market.dto.PageDTO;
import com.its.market.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    public BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile1 = boardDTO.getBoardFile1();
        String boardFile = boardFile1.getOriginalFilename(); //1,2
        boardFile = System.currentTimeMillis() + "-" + boardFile; // 2.1
        boardDTO.setBoardFile(boardFile); // 3
        String savePath = "C:\\spring_img\\" + boardFile; //4
        //5
        if(!boardFile1.isEmpty()){
            boardFile1.transferTo(new File(savePath));
        }else {
            boardDTO.setBoardFile(null);
        }
        MultipartFile boardProfile1 = boardDTO.getBoardProfile1();
        String boardProfile = boardProfile1.getOriginalFilename(); //1,2
        boardProfile = System.currentTimeMillis() + "-" + boardProfile; // 2.1
        boardDTO.setBoardProfile(boardProfile); // 3
        String savePath1 = "C:\\spring_img\\" + boardProfile; //4
        //5
        if(!boardProfile1.isEmpty()){
            boardProfile1.transferTo(new File(savePath1));
        }else {
            boardDTO.setBoardProfile(null);
        }

        System.out.println("boardDTO = " + boardDTO);

        boardRepository.save(boardDTO);
    }


    public BoardDTO findById(int id) {
        return boardRepository.findById(id);
    }

    public void delete(int id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) throws IOException {

        MultipartFile boardFile1 = boardDTO.getBoardFile1();
        String boardFile = boardFile1.getOriginalFilename(); //1,2
        boardFile = System.currentTimeMillis() + "-" + boardFile; // 2.1
        boardDTO.setBoardFile(boardFile); // 3
        String savePath = "C:\\spring_img\\" + boardFile; //4
        //5
        if(!boardFile1.isEmpty()){
            boardFile1.transferTo(new File(savePath));
        }else {
            boardDTO.setBoardFile(null);
        }
        MultipartFile boardProfile1 = boardDTO.getBoardProfile1();
        String boardProfile = boardProfile1.getOriginalFilename(); //1,2
        boardProfile = System.currentTimeMillis() + "-" + boardProfile; // 2.1
        boardDTO.setBoardProfile(boardProfile); // 3
        String savePath1 = "C:\\spring_img\\" + boardProfile; //4
        //5
        if(!boardProfile1.isEmpty()){
            boardProfile1.transferTo(new File(savePath1));
        }else {
            boardDTO.setBoardProfile(null);
        }

        System.out.println("boardDTO = " + boardDTO);

        boardRepository.update(boardDTO);
    }

    private static final int PAGE_LIMIT = 5; // ??? ???????????? ????????? ??? ??????
    private static final int BLOCK_LIMIT = 3; // ????????? ????????? ??????
    public List<BoardDTO> findAll(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);

        return pagingList;
    }

    public PageDTO paging(int page) {
        int memberCount = boardRepository.boardCount();
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

    public List<BoardDTO> findCategory(int page , String boardCategory) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setId(pagingStart); // start
        boardDTO.setBoardHits(PAGE_LIMIT); // limit
        boardDTO.setBoardCategory(boardCategory); //category
        List<BoardDTO> pagingList = boardRepository.pagingCategory(boardDTO);

        return pagingList;
    }

    public PageDTO pagingCategory(int page , String boardCategory) {
        int memberCount = boardRepository.CategoryCount(boardCategory);
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

    public List<BoardDTO> findSale(int page, String status, Object loginMemberId) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        PageDTO pageDTO = new PageDTO();
        pageDTO.setStartPage(pagingStart); // start
        pageDTO.setEndPage(PAGE_LIMIT); // limit
        pageDTO.setStatus(status); //status
        pageDTO.setLoginId((String) loginMemberId); // memberId
        return boardRepository.pagingSale(pageDTO);
    }

    public PageDTO pagingSale(int page, String status, Object loginMemberId) {
        PageDTO count = new PageDTO();
        count.setStatus(status);
        count.setLoginId((String) loginMemberId);
        int memberCount = boardRepository.SaleCount(count);
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

    public List<BoardDTO> findByList(Object loginMemberId) {
        return boardRepository.findByList(loginMemberId);
    }

    public BoardDTO findById1(int boardId) {
        return boardRepository.findById1(boardId);
    }


    public List<BoardDTO> search(String search, String type) {
        if (type.equals("??????")){
            return boardRepository.searchAll(search);
        }else{
            Map<String,String> searchMap = new HashMap<>();
            searchMap.put("type",type);
            searchMap.put("search",search);
            return boardRepository.search(searchMap);
        }
    }

    public List<BoardDTO> findIndex() {
        return boardRepository.findIndex();
    }
}
