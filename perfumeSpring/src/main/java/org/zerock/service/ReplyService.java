package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;

public interface ReplyService {
	
	public int register(ReplyDTO dto);
	public ReplyDTO get(Long rno); // 특정 댓글 읽기
	public int remove(Long rno);
	public int modify(ReplyDTO dto);
	public List<ReplyDTO> getList(Criteria cri, Long bno);
	
}
