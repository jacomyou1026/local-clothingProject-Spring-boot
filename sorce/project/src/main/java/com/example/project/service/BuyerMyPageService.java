package com.example.project.service;

import com.example.project.dto.BuyerMyPageDTO;
import org.springframework.stereotype.Service;

@Service
public interface BuyerMyPageService {

    public BuyerMyPageDTO selectlist(String buyerID);
    public void updateBuyer(BuyerMyPageDTO dto);

    public int deleteBuyer(String buyer);

    public BuyerMyPageDTO MypageLogin(BuyerMyPageDTO dto);
}
