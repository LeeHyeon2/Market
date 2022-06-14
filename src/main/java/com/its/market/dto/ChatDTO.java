package com.its.market.dto;

import lombok.Data;

@Data
public class ChatDTO {
    public int id;
    public int boardId;
    public String memberId;
    public String contents;
    public String chatTime;
}
