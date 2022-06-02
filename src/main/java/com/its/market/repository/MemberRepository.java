package com.its.market.repository;

import com.its.market.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public void delete(Object loginId) {
        sql.delete("Member.delete",loginId);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public List<MemberDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Member.pagingList", pagingParam);
    }
    public int memberCount() {
        return sql.selectOne("Member.count");
    }
}
