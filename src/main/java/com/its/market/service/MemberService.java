package com.its.market.service;

import com.its.market.dto.MemberDTO;
import com.its.market.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    public MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String duplicateCheck = memberRepository.duplicateCheck(memberId);
        if(memberId == "") {
            return "no";
        }else if(duplicateCheck == null){
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public MemberDTO findById(Object loginId) {
        return memberRepository.findById(loginId);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
