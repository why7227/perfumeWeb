package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;

public interface ReplyMapper {

	public int insert(ReplyDTO dto);
	public ReplyDTO read(Long rno); // 특정 댓글 읽기
	public int delete(Long rno);
	public int update(ReplyDTO reply);
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
}
