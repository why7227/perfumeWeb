package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardDTO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public void register(BoardDTO board) {
		
		log.info("register....." + board);
		
		mapper.insertSelectKey(board);	
	}

	@Override
	public BoardDTO get(Long bno) {

		log.info("get....." + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardDTO board) {
		
		log.info("modify....." + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		
		log.info("delete....." + bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count: ");
		
		return mapper.getTotalCount(cri);
	}
}
