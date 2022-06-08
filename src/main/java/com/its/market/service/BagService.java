package com.its.market.service;

import com.its.market.dto.BagDTO;
import com.its.market.repository.BagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
