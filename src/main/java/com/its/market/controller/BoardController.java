package com.its.market.controller;

import com.its.market.dto.*;
import com.its.market.service.BagService;
import com.its.market.service.BoardService;
import com.its.market.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    public BoardService boardService;
    @Autowired
    public BagService bagService;
    @Autowired
    public TradeService tradeService;

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
    public String sale(HttpSession session,Model model,@RequestParam("id") int id,@RequestParam(value="page", required=false, defaultValue="1") int page){
        String status = "";
        if(id==1){
           status = "판매중";
        }else if(id==2){
           status = "판매완료";
        }else {
           status = "거래중";
        }
        List<BoardDTO> boardDTOS = boardService.findSale(page,status,session.getAttribute("loginMemberId"));
        PageDTO paging = boardService.pagingSale(page,status,session.getAttribute("loginMemberId"));
        model.addAttribute("id",id);
        model.addAttribute("boardDTO",boardDTOS);
        model.addAttribute("paging",paging);
        return "/board/saleList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id , HttpSession session ,Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        BagDTO bagDTO = new BagDTO();
        bagDTO.setMemberId((String) session.getAttribute("loginMemberId"));
        bagDTO.setBoardId(id);
        BagDTO bag = bagService.findById(bagDTO);
        TradeDTO tradeDTO = tradeService.findById(id);
        model.addAttribute("tradeDTO",tradeDTO);
        model.addAttribute("bag",bag);
        model.addAttribute("boardDTO",boardDTO);
        return "/board/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id ){
        boardService.delete(id);
        return "redirect:/";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") int id , Model model){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO",boardDTO);
        return "/board/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id=" + boardDTO.getId();
    }

    @GetMapping("/item")
    public String item(@RequestParam(value="page", required=false, defaultValue="1") int page,Model model){
        List<BoardDTO> boardDTOS = boardService.findAll(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardDTO",boardDTOS);
        model.addAttribute("paging",paging);


        return "/board/item";
    }

    @GetMapping("/category")
    public String category(@RequestParam("boardCategory") String boardCategory,@RequestParam(value="page", required=false, defaultValue="1") int page,Model model){
        if (boardCategory.equals("전체보기" )){
            return "redirect:/board/item";
        }else{
            List<BoardDTO> boardDTOS = boardService.findCategory(page,boardCategory);
            PageDTO paging = boardService.pagingCategory(page,boardCategory);
            model.addAttribute("category",boardCategory);
            model.addAttribute("boardDTO",boardDTOS);
            model.addAttribute("paging",paging);
            return "/board/category";
        }
    }

    @GetMapping("/search")
    public String search(@RequestParam("search") String search,
                         @RequestParam("type") String type ,Model model){

        List<BoardDTO> boardDTO = boardService.search(search,type);

        model.addAttribute("search",search);
        model.addAttribute("type",type);
        model.addAttribute("boardDTO",boardDTO) ;
        return "/board/search";
    }

    @PostMapping("/search")
    public String search1(@RequestParam("search") String search,
                         @RequestParam("type") String type ,Model model){

        List<BoardDTO> boardDTO = boardService.search(search,type);

        model.addAttribute("search",search);
        model.addAttribute("type",type);
        model.addAttribute("boardDTO",boardDTO) ;
        return "/board/search";
    }
}