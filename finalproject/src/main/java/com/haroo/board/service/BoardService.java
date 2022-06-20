package com.haroo.board.service;

import java.util.List;

//import org.zerock.domain.BoardAttachVO;
import com.haroo.board.domain.BoardVO;
import com.haroo.board.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	//public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	//public List<BoardAttachVO> getAttachList(Long bno);
	public int hitCount(Long bdNo);
}
