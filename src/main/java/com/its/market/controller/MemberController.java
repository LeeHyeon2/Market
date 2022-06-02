package com.its.market.controller;

import com.its.market.dto.MemberDTO;
import com.its.market.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    public MemberService memberService;

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
    public String loginForm(){
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model , HttpSession session){
        MemberDTO login = memberService.login(memberDTO);
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
        return "/index";
    }
}
