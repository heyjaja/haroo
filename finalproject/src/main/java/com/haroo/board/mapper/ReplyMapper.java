package com.haroo.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.haroo.board.domain.Criteria;
import com.haroo.board.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(Long bno);

	public int delete(Long bno);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bdNo") Long bdNo);

//	public int getCountByBno(Long bno);
}
