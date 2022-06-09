package com.its.market.controller;


import com.its.market.dto.BagDTO;
import com.its.market.dto.BoardDTO;
import com.its.market.service.BagService;
import com.its.market.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String delete(@RequestParam("memberId") String memberId , @RequestParam("boardId") int boardId
                        ,@RequestParam("myBag") int myBag){
        BagDTO bagDTO = new BagDTO();
        bagDTO.setMemberId(memberId);
        bagDTO.setBoardId(boardId);
        bagService.delete(bagDTO);
        if (myBag == 1){
            return "redirect:/bag/myBag";
        }else{
            return "redirect:/board/detail?id=" + boardId;
        }
    }

    @GetMapping("/myBag")
    public String myBag(Model model , HttpSession session){
        List<BagDTO> bagDTOS = bagService.findList(session.getAttribute("loginMemberId"));
        List<BoardDTO> boardDTOS = new ArrayList<>();
        for (int i = 0; i < bagDTOS.size();i++){
            BoardDTO boardDTO = boardService.findById(bagDTOS.get(i).getBoardId());
            boardDTOS.add(boardDTO);
        }
        model.addAttribute("boardDTO",boardDTOS);
        return "/bag/myBag";
    }
}
