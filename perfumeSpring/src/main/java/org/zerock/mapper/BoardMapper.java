package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardDTO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
public List<BoardDTO> getList();    // 게시물 전체 가져오기
public List<BoardDTO> getListWithPaging(Criteria cri); // 페이징처리
public int getTotalCount(Criteria cri); // 게시물 리스트 총 갯수
public void insert(BoardDTO board); // 게시글 등록
public void insertSelectKey(BoardDTO board); // 게시글 등록(게시물번호 알고싶을떄)
public BoardDTO read(Long bno);     // 특정 게시물 가져오기
public int delete(Long bno);        // 게시물 삭제
public int update(BoardDTO board);  // 게시물 수정

public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

}
