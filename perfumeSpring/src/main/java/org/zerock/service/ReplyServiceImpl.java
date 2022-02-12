package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	private BoardMapper boardmapper;
	
	@Transactional
	@Override
	public int register(ReplyDTO dto) {

		log.info("register: " + dto);
		
		boardmapper.updateReplyCnt(dto.getBno(),1);
		return mapper.insert(dto);
	}

	@Override
	public ReplyDTO get(Long rno) {

		log.info("get: " + rno);
		
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {

		log.info("remove: " + rno);
		
		ReplyDTO dto = mapper.read(rno);
		boardmapper.updateReplyCnt(dto.getBno(),-1);
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyDTO dto) {

		log.info("update: " + dto);
		
		return mapper.update(dto);
	}

	@Override
	public List<ReplyDTO> getList(Criteria cri, Long bno) {

		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
}
