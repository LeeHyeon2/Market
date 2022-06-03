package com.its.market.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardDTO {
    int id;
    String memberId;
    String boardTitle;
    String boardContents;
    String boardCategory;
    String boardAddress;
    String boardPrice;
    String boardDate;
    String boardStatus;
    MultipartFile boardProfile1;
    MultipartFile boardFile1; // saveFile.jsp 에서 컨트롤러로 넘어올 때 파일을 담아오는 용도
    String boardFile;
    String boardProfile;
    int boardHits;
}
