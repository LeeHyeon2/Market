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
}
