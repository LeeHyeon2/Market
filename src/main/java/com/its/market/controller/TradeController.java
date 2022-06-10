package com.its.market.controller;

import com.its.market.dto.BoardDTO;
import com.its.market.dto.PageDTO;
import com.its.market.dto.TradeDTO;
import com.its.market.service.BoardService;
import com.its.market.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/trade")
public class TradeController {
    @Autowired
    public TradeService tradeService;
    @Autowired
    public BoardService boardService;

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
    public String success(@RequestParam("id") int id,
                          @RequestParam("sale") int sale){
        tradeService.success(id);
        if (sale==1){
            return "redirect:/board/sale?id=3";
        }else if(sale == 3){
            return "redirect:/trade/list?id=1";
        }else{
            return "redirect:/board/detail?id=" + id;
        }
    }

    @GetMapping("/fail")
    public String fail(@RequestParam("id") int id,
                       @RequestParam("sale") int sale){
        tradeService.fail(id);
        if (sale==1){
            return "redirect:/board/sale?id=3";
        }else if(sale == 3){
            return "redirect:/trade/list?id=1";
        }else{
            return "redirect:/board/detail?id=" + id;
        }
    }

    @GetMapping("/list")
    public String list(@RequestParam("id") int id , Model model, @RequestParam(value="page", required=false, defaultValue="1") int page, HttpSession session){
        // id = 1 -> 거래중 , 2-> 구매목록 , 3 -> 판매목록 , 4 -> 구매+판매목록
        String loginId = (String) session.getAttribute("loginMemberId");
        List<TradeDTO> tradeDTOS = tradeService.findAll(session.getAttribute("loginMemberId"));
        List<TradeDTO> tradeDTO = new ArrayList<>();
        if (id == 1){
            for (int i = 0; i<tradeDTOS.size();i++){
                if(tradeDTOS.get(i).getTradeStatus().equals("거래중")){
                   tradeDTO.add(tradeDTOS.get(i));
                }
            } //거래중 글 받아오기
        }else if(id == 2){
            for (int i = 0; i<tradeDTOS.size();i++){
                if (tradeDTOS.get(i).getTradeStatus().equals("거래완료")){
                    if(tradeDTOS.get(i).getBuyMemberId().equals(loginId)){
                        tradeDTO.add(tradeDTOS.get(i));
                    }
                }
            }
        }else if (id == 3){
            for (int i = 0; i<tradeDTOS.size();i++){
                if (tradeDTOS.get(i).getTradeStatus().equals("거래완료")){
                    if(tradeDTOS.get(i).getSaleMemberId().equals(loginId)){
                        tradeDTO.add(tradeDTOS.get(i));
                    }
                }
            }

        }else{
            for (int i = 0; i<tradeDTOS.size();i++){
                if (tradeDTOS.get(i).getTradeStatus().equals("거래완료")){
                    tradeDTO.add(tradeDTOS.get(i));

                }
            }
        }
        PageDTO paging = tradeService.pageList(page,tradeDTO.size());
        List<TradeDTO> tradeDTOS1 = new ArrayList<>();
        int count = 0;
        for (int i = (-1+page)*5 ; count<5 ; count++){
            if (i== tradeDTO.size()){
                break;
            }
            tradeDTOS1.add(tradeDTO.get(i));
            i++;
        }

        model.addAttribute("tradeDTO",tradeDTOS1);
        model.addAttribute("paging",paging);
        model.addAttribute("id",id);
        return "/trade/list";
    }
}
