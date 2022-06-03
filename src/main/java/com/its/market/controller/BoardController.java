package com.its.market.controller;

import com.its.market.dto.BoardDTO;
import com.its.market.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        for(int i = 0 ; i<boardDTOS.size() ; i++){
            System.out.println(boardDTOS.get(i).getBoardStatus());
            if(boardDTOS.get(i).getBoardStatus().equals("판매중")){
                count1++;
            }
            if(boardDTOS.get(i).getBoardStatus().equals("판매완료")) {
                count2++;
            }
        }
        model.addAttribute("ing",count1);
        model.addAttribute("end",count2);
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


}
