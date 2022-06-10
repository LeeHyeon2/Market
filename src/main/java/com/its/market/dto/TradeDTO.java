package com.its.market.dto;

import lombok.Data;

@Data
public class TradeDTO {
    private int id ;
    private String saleMemberId;
    private String buyMemberId;
    private int boardId;
    private String tradeStatus;
    private String tradeTime;
}
