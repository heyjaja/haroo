package com.haroo.board.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.board.domain.BoardVO;
import com.haroo.board.domain.Criteria;
import com.haroo.board.mapper.BoardMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContents("새로 작성하는 내용");
		board.setWriter("박민준");
		board.setEmNo(19362300);
		
		service.register(board);
		
		log.info("생성된 게시물의 번호: " + board.getBdNo());
	}

	@Test
	public void testGetList() {
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(1L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = service.get(1L);
		
		if(board==null) {
			return;
		}
		
		board.setTitle("제목을 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(board));
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(6L));
	}

}
