package com.its.market.repository;

import com.its.market.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    public SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicate",memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO findById(Object loginId) {
        return sql.selectOne("Member.findById",loginId);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update",memberDTO);
    }
}
