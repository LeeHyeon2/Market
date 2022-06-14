package com.its.market.controller;

import com.its.market.dto.ChatDTO;
import com.its.market.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    public ChatService chatService;

    @GetMapping("/start")
    public String start(@RequestParam("id") int id, Model model){
        model.addAttribute("id" , id);
        return "/chat/room" ;
    }

    @GetMapping("/chat")
    public @ResponseBody List<ChatDTO> chat(@RequestParam("id") int id){
        return chatService.findById(id);
    }

    @GetMapping("/save")
    public @ResponseBody String save(@ModelAttribute ChatDTO chatDTO , HttpSession session) {
        chatDTO.setMemberId((String) session.getAttribute("loginMemberId"));
        String chat = chatService.save(chatDTO);
        return chat;
    }
}
