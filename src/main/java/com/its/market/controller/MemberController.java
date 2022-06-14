package com.its.market.controller;

import com.its.market.dto.BoardDTO;
import com.its.market.dto.MemberDTO;
import com.its.market.dto.PageDTO;
import com.its.market.dto.TradeDTO;
import com.its.market.service.BagService;
import com.its.market.service.BoardService;
import com.its.market.service.MemberService;
import com.its.market.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    public MemberService memberService;
    @Autowired
    public BoardService boardService;
    @Autowired
    public BagService bagService;
    @Autowired
    public TradeService tradeService;

    @GetMapping("/save")
    public String saveForm(){
        return "/member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        memberService.save(memberDTO);
        return "/member/login";
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String check = memberService.duplicateCheck(memberId);
        System.out.println(check);
        return check ;
    }

    @GetMapping("/login")
    public String loginForm(Model model){
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model , HttpSession session){
        MemberDTO login = memberService.login(memberDTO);
        List<BoardDTO> boardDTOList = boardService.findIndex();
        model.addAttribute("boardDTO",boardDTOList);
        if(login != null){
            if(login.getMemberId().equals("admin")){
                model.addAttribute("login", login);
                session.setAttribute("loginMemberId", login.getMemberId());
                session.setAttribute("loginMemberPassword", login.getMemberPassword());
                session.setAttribute("loginMemberName", login.getMemberName());
                session.setAttribute("loginId", login.getId());
                return "/index";
            }else {
                model.addAttribute("login", login);
                session.setAttribute("loginMemberId", login.getMemberId());
                session.setAttribute("loginMemberPassword", login.getMemberPassword());
                session.setAttribute("loginMemberName", login.getMemberName());
                session.setAttribute("loginId", login.getId());
                return "/index";
            }
        }else{
            model.addAttribute("msg","fail");
            return "/member/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/myPage")
    public String myPageForm(Model model , HttpSession session){
        String id = (String) session.getAttribute("loginMemberId");
        int myBag = bagService.myBag(session.getAttribute("loginMemberId"));
        List<TradeDTO> tradeDTOS = tradeService.myPage(session.getAttribute("loginMemberId"));
        int trading = 0;
        int buy = 0;
        int sell = 0;
        for (int i=0; i<tradeDTOS.size();i++){
            if(tradeDTOS.get(i).getTradeStatus().equals("거래중")){
                trading++;
            }else {
                if (tradeDTOS.get(i).getBuyMemberId().equals(id)){
                    buy++;
                }else {
                    sell++;
                }
            }
        }
        model.addAttribute("trading",trading);
        model.addAttribute("buy",buy);
        model.addAttribute("sell",sell);
        model.addAttribute("myBag",myBag);
        return "/member/myPage";
    }

    @GetMapping("/update")
    public String updateForm(Model model,HttpSession session){
        MemberDTO memberDTO = memberService.findById(session.getAttribute("loginId"));
        model.addAttribute("memberDTO",memberDTO);
        return "/member/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return "/member/myPage";
    }

    @GetMapping("/delete")
    public String delete(HttpSession session){
        memberService.delete(session.getAttribute("loginId"));
        session.invalidate();
        return "/index";
    }

    @GetMapping("/delete1")
    public String delete1(@RequestParam("id") int id){
        memberService.delete(id);
        return "redirect:/member/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){
        List<MemberDTO> memberDTOList = memberService.findAll(page);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("memberList",memberDTOList);
        model.addAttribute("paging",paging);
        return "/member/findAll";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") int id , Model model){
        MemberDTO memberDTO = memberService.findById(id);
        List<BoardDTO> boardDTOS = boardService.findByList(memberDTO.getMemberId());
        model.addAttribute("boardDTO",boardDTOS);
        model.addAttribute("member",memberDTO);
        return "/member/detail";
    }

    @GetMapping("/test")
    public @ResponseBody List<MemberDTO> test() {
        List<MemberDTO> memberDTOList = memberService.findAll(1);
        System.out.println("memberDTOList = " + memberDTOList);
        return memberDTOList;
    }
}
