package com.its.market.service;

import com.its.market.dto.BagDTO;
import com.its.market.repository.BagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BagService {
    @Autowired
    public BagRepository bagRepository;


    public BagDTO findById(BagDTO bagDTO) {
        return bagRepository.findById(bagDTO);
    }

    public void update(BagDTO bagDTO) {
        bagRepository.update(bagDTO);
    }

    public void delete(BagDTO bagDTO) {
        bagRepository.delete(bagDTO);
    }

    public int myBag(Object loginMemberId) {
        return bagRepository.myBag(loginMemberId);
    }

    public List<BagDTO> findList(Object loginMemberId) {
        return bagRepository.findList(loginMemberId);
    }
}
