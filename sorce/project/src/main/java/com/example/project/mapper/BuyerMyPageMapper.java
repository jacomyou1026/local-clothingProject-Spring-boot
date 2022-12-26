package com.example.project.mapper;

import com.example.project.dto.BuyerMyPageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyerMyPageMapper {

//    구매자 조회
    public BuyerMyPageDTO selectBuyer(String buyerID);

//    개인정보 수정
    public void updateBuyer(BuyerMyPageDTO dto);

    int deleteBuyer(String buyer);

    public BuyerMyPageDTO mypageLogin(BuyerMyPageDTO dto);

}
