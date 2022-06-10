package com.its.market.controller;

import com.its.market.dto.TradeDTO;
import com.its.market.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/trade")
public class TradeController {
    @Autowired
    public TradeService tradeService;

    @GetMapping("/trade")
    public String trade(@RequestParam("saleMemberId") String sale,
                        @RequestParam("buyMemberId") String buy,
                        @RequestParam("boardId") int boardId){
        TradeDTO tradeDTO = new TradeDTO();
        tradeDTO.setSaleMemberId(sale);
        tradeDTO.setBuyMemberId(buy);
        tradeDTO.setBoardId(boardId);
        tradeService.trade(tradeDTO,boardId);

        return "redirect:/board/detail?id=" + boardId;
    }

    @GetMapping("/success")
    public String success(@RequestParam("id") int id){
        tradeService.success(id);
        return "redirect:/board/detail?id=" + id;
    }

    @GetMapping("/fail")
    public String fail(@RequestParam("id") int id){
        tradeService.fail(id);
        return "redirect:/board/detail?id=" + id;
    }
}
