package com.example.project.controller;

import com.example.project.dto.BuyerMyPageDTO;
import com.example.project.service.BuyerMyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
@RequestMapping("/buyerMyPage")
public class BuyerMyPageController {
    private final BuyerMyPageService buyerMyPageService;

//개인정보 조회
    @GetMapping("/buyerInfo/{buyerID}")
    public String buyermypage(@PathVariable String buyerID, Model model){
         model.addAttribute("buyer", buyerMyPageService.selectlist(buyerID));
        BuyerMyPageDTO selectlist   = buyerMyPageService.selectlist(buyerID);
        System.out.println(selectlist.getBuyerID()+"IDID");
        return "buyerMyPage/buyerInfo";
    }
    
//개인정보 수정
    @GetMapping("/buyerChangeInfo/{buyerID}")
    public String buyerChangepage( BuyerMyPageDTO dto, Model model){
        model.addAttribute("buyer", dto);
         return "buyerMyPage/buyerChangeInfo";
    }

    @PostMapping("/buyerChangeSuccess/{buyerID}")
    public String insertView(BuyerMyPageDTO dto){
        System.out.println("성공!!!");

        System.out.println(dto.getNickname());
//       개인정보 수정
        buyerMyPageService.updateBuyer(dto);


        return "redirect:/buyerMyPage/buyerInfo/{buyerID}";
    }



//    회원탈퇴 페이지 이동
    @RequestMapping("/{buyerID}/delete.do")
    public String MydeletePage(@PathVariable String buyerID,Model model ){
        model.addAttribute("buyerid",buyerID);
        return "buyerMyPage/deleteMyPage";
    }


//    회원 로그인 인증
    @ResponseBody
    @GetMapping(value ="/MyPagelogin")
    public String mypageLogin(BuyerMyPageDTO dto){

        System.out.println(dto.getBuyerID()+"id"+dto.getPassword()+"sdf"+dto.getNickname());
        //로그인 조회
        BuyerMyPageDTO login =  buyerMyPageService.MypageLogin(dto);
        String res = "";

//        로그인 없을 경우
        if(login == null){
             res ="0";

        }else{
             res ="1";
        }


        System.out.println(res);
        return res;
    }
    


//    회원탈퇴 
//    ** 수정 요함-- 나중에 main 으로
//    삭제해야함
    @RequestMapping("/del.do")
    public String BuyerDel(String buyer)  {

//        삭제
         int isokay  = buyerMyPageService.deleteBuyer(buyer);
//         삭제 실패
         if(isokay != 1){
             System.out.println("삭제 실패= "+isokay);
             return "redirect:/buyerMyPage/"+buyer;
         }else{
             System.out.println("삭제 성공 = "+isokay);
         }


        return "main";
    }





}
