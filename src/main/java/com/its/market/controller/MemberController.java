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

    @GetMapping("/myPage")
    public String myPageForm(){
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
}
