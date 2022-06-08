package com.its.market.controller;

import com.its.market.dto.BoardDTO;
import com.its.market.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    public BoardService boardService;

    @GetMapping("/myPage")
    public String myPageForm(Model model , HttpSession session){
        List<BoardDTO> boardDTOS = boardService.findByList(session.getAttribute("loginMemberId"));
        int count1 = 0;
        int count2 = 0;
        int count3 = 0;
        for(int i = 0 ; i<boardDTOS.size() ; i++){
            if(boardDTOS.get(i).getBoardStatus().equals("판매중")){
                count1++;
            }
            if(boardDTOS.get(i).getBoardStatus().equals("판매완료")) {
                count2++;
            }
            if(boardDTOS.get(i).getBoardStatus().equals("거래중")) {
                count3++;
            }
        }
        model.addAttribute("ing",count1);
        model.addAttribute("end",count2);
        model.addAttribute("selling",count3);
        return "/board/myPage";
    }

    @GetMapping("/save")
    public String saveForm(){
        return "/board/save";
    }


    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/myPage";
    }

    @GetMapping("/sale")
    public String sale(HttpSession session,Model model,@RequestParam("id") int id){
        List<BoardDTO> boardDTOS = boardService.findByList(session.getAttribute("loginMemberId"));
        model.addAttribute("id",id);
        model.addAttribute("boardDTO",boardDTOS);
        return "/board/saleList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id , Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO",boardDTO);
        return "/board/detail";
    }
}
