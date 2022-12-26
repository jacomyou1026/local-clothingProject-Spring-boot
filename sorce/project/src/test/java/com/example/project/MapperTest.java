package com.example.project;

import com.example.project.dto.BuyerMyPageDTO;
import com.example.project.mapper.BuyerMyPageMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MapperTest {
    @Autowired
    private com.example.project.mapper.BuyerMyPageMapper BuyerMyPageMapper;

	@Test
	public void test(){
//		MemberVo m1 = new MemberVo();
//
//		m1.setName("장발");
//		m1.setId("mr.bsoon");
//		m1.setPhone("000-333-8888");
//
//		System.out.println(m1);
//		memberMapper.insertMember(m1);


	}

	@Test
	public void delete(){
		int a = BuyerMyPageMapper.deleteBuyer("Una");
		System.out.println(a );
	}

	@Test
	public void Login(){
		BuyerMyPageDTO dto = new BuyerMyPageDTO();
		dto.setBuyerID("13");
		dto.setPassword("214142");
		BuyerMyPageDTO a = BuyerMyPageMapper.mypageLogin(dto);
		System.out.println(a );
	}






}
