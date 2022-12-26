package com.example.project.service;

import com.example.project.dto.BuyerMyPageDTO;
import com.example.project.mapper.BuyerMyPageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class BuyerMyPageServiceImpl implements BuyerMyPageService{
    private final BuyerMyPageMapper mapper;


    @Override
    public BuyerMyPageDTO selectlist(String buyerID) {
        return mapper.selectBuyer(buyerID);
    }

    @Override
    public void updateBuyer(BuyerMyPageDTO dto) {
        mapper.updateBuyer(dto);
    }

    @Override
    public int deleteBuyer(String buyer) {
        return mapper.deleteBuyer(buyer);
    }

    @Override
    public BuyerMyPageDTO MypageLogin(BuyerMyPageDTO dto) {
        return mapper.mypageLogin(dto);
    }
}
