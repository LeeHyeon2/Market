package com.its.market;

import com.its.market.dto.BoardDTO;
import com.its.market.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    public BoardService boardService;

    @GetMapping("/")
    public String index(Model model){
        List<BoardDTO> boardDTOList = boardService.findIndex();
        model.addAttribute("boardDTO",boardDTOList);
        return "/index";
    }

    @GetMapping("/test")
    public String test(){
        return "/test";
    }
}
