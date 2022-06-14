package com.its.market.repository;

import com.its.market.dto.ChatDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChatRepository {
    @Autowired
    public SqlSessionTemplate sql;

    public List<ChatDTO> findAll() {
        return sql.selectList("Chat.findAll");
    }

    public List<ChatDTO> findById(int id) {
        return sql.selectList("Chat.findById",id);
    }

    public void save(ChatDTO chatDTO) {
        sql.insert("Chat.save",chatDTO);
    }
}
