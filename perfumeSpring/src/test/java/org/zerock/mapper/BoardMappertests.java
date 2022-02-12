package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardDTO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMappertests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testInsert() {
		
		BoardDTO board = new BoardDTO();
		board.setTitle("향수 대박!");
		board.setContent("지나가는 사람들이 향수 뭐쓰냐고 물어봐요");
		board.setWriter("newbie");
		
		mapper.insert(board);
		log.info("==========================================================");
		log.info(board);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(10); 
		List<BoardDTO> list = mapper.getListWithPaging(cri);
		log.info("==========================================================");
		list.forEach(board -> log.info(board.getBno()));
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardDTO board = new BoardDTO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용  select key");
		board.setWriter("newbie");
		
		mapper.insertSelectKey(board);
		log.info("==========================================================");
		log.info(board);
	}
	
	@Test
	public void testRead() {
		BoardDTO board = mapper.read(1L);
		
		log.info("==========================================================");
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		
		log.info("==========================================================");
		log.info("delete count: " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
	
		BoardDTO board = new BoardDTO();
		board.setBno(1L); // 업데이트 전 존재하는 번호인지 확인
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("김희정");
		
		int count = mapper.update(board);
		log.info("==========================================================");
		log.info("update count: " + count);
	}
}
