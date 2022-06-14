package com.its.market.service;

import com.its.market.dto.ChatDTO;
import com.its.market.repository.ChatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {
    @Autowired
    public ChatRepository chatRepository;

    public List<ChatDTO> findAll() {
        return chatRepository.findAll();
    }

    public List<ChatDTO> findById(int id) {
        return chatRepository.findById(id);
    }


    public String save(ChatDTO chatDTO) {
        chatRepository.save(chatDTO);
        return "good";
    }
}
