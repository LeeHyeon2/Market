package com.its.market.controller;


import com.its.market.dto.BagDTO;
import com.its.market.dto.BoardDTO;
import com.its.market.dto.PageDTO;
import com.its.market.service.BagService;
import com.its.market.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/bag")
public class BagController {
    @Autowired
    public BagService bagService;
    @Autowired
    public BoardService boardService;

    @GetMapping("/update")
    public String update(@RequestParam("memberId") String memberId , @RequestParam("boardId") int boardId){
        BagDTO bagDTO = new BagDTO();
        bagDTO.setMemberId(memberId);
        bagDTO.setBoardId(boardId);
        bagService.update(bagDTO);
        return "redirect:/board/detail?id=" + boardId;
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("memberId") String memberId , @RequestParam("boardId") int boardId ,@RequestParam("bag") int bag){
        BagDTO bagDTO = new BagDTO();
        bagDTO.setMemberId(memberId);
        bagDTO.setBoardId(boardId);
        bagService.delete(bagDTO);
        if(bag == 0){
            return "redirect:/bag/myBag";
        }else{
            return "redirect:/board/detail?id=" + boardId;
        }

    }

    @GetMapping("/myBag")
    public String myBag(Model model , HttpSession session,@RequestParam(value="page", required=false, defaultValue="1") int page){
        List<BagDTO> bagDTOS = bagService.findList(session.getAttribute("loginMemberId"));
        PageDTO paging = bagService.pageMyBag(page , bagDTOS.size());
        List<BoardDTO> boardDTOS = new ArrayList<>();
        for (int i = 0; i < bagDTOS.size();i++){
            BoardDTO boardDTO = boardService.findById1(bagDTOS.get(i).getBoardId());
            boardDTOS.add(boardDTO);
        }// 리스트를 전부 담아옴
        List<BoardDTO> boardDTO = new ArrayList<>();
        int count = 0;
        for(int i = (-1+page)*5 ; count < 5 ; count++){
            if (i ==    boardDTOS.size()){
                break;
            }
            boardDTO.add(boardDTOS.get(i));
            i++;
        }
        model.addAttribute("boardDTO",boardDTO);
        model.addAttribute("paging",paging);
        return "/bag/myBag";
    }

}
