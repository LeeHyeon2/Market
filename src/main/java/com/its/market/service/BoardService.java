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

    public List<BoardDTO> findByList(Object loginId) {
        return boardRepository.findByList(loginId);
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

    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 페이지 버튼의 갯수
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
}
