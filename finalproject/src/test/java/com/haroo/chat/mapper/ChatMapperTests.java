package com.haroo.chat.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.chat.domain.ChatVO;
import com.haroo.chat.domain.EmpVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatMapperTests {

	@Autowired
	private ChatMapper mapper;

//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testRead() {
//		
//		//존재하는 게시물 번호로 테스트
//		EmpVO empVO = mapper.read(3L);
//		
//		log.info(empVO);
//		
//	}
	
	@Test
	public void testGetChatList( ) {

		Long targetem_no = 5L;
		
		ChatVO vo = mapper.getChatList(targetem_no);
		
		log.info(vo);
	}
}
