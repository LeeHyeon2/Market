package com.its.market.dto;

import lombok.Data;

@Data
public class PageDTO {
    private int page; // 현재페이지
    private int maxPage; // 필요한 페이.지지 갯수
    private int startPage; // 시작페이지
    private int endPage; // 마지막파이제
    private String loginId; // 로그인 아이디
    private String status; // 판매 상태
}
