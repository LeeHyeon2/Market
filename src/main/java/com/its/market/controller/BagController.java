package com.its.market.controller;


import com.its.market.dto.BagDTO;
import com.its.market.service.BagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/bag")
public class BagController {
    @Autowired
    public BagService bagService;

    @GetMapping("/update")
    public String update(@RequestParam("memberId") String memberId , @RequestParam("boardId") int boardId){
        BagDTO bagDTO = new BagDTO();
        bagDTO.setMemberId(memberId);
        bagDTO.setBoardId(boardId);
        bagService.update(bagDTO);
        return "redirect:/board/detail?id=" + boardId;
    }
}
