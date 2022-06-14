package com.haroo.board.mapper;

import static org.junit.Assert.*;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.haroo.board.domain.Criteria;
import com.haroo.board.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;

	private Long[] bnoArr = { 58L, 67L, 68L, 69L, 70L };

	@Test
	public void testMapper() {
		log.info(mapper);
	}

	@Test
	public void testCreare() {
		
			ReplyVO vo = new ReplyVO();

			// 게시물의 번호
			vo.setBdNo(90L);
			vo.setReContents("댓글테스트");
			vo.setReWriter("박민준");

			mapper.insert(vo);
		
	}
	
	@Test
	public void testRead() {
		
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		
		Long targetRno = 2L;
		
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		
		Long targetRno = 8L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReContents("Update Reply ");
		
		int count= mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
//	@Test
//	public void testList2() {
//		
//		Criteria cri = new Criteria();
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1679367L);
//		
//		replies.forEach(reply -> log.info(reply));
//	}

}
