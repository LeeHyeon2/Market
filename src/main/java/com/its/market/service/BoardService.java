package com.its.market.service;

import com.its.market.dto.BoardDTO;
import com.its.market.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
}
