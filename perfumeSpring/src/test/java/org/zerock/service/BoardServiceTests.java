package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test // 서비스 객체가 주입되는지 확인
	public void testExist() {
		
		log.info("==========================================================");
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		 BoardDTO board = new BoardDTO();
		 board.setTitle("새로 작성하는 제목");
		 board.setContent("새로 작성하는 글");
		 board.setWriter("김루루");
		 
		 service.register(board);
		log.info("==========================================================");
		log.info("생성된 게시물의 번호: " + board.getBno());
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		
		log.info("==========================================================");
		log.info(service.get(1L));
	}
	
	@Test
	public void testModify() {
		
		BoardDTO board = service.get(2L);
		
		if(board == null) {
			return;
		}
		board.setTitle("제목 수정했어!!");
		board.setContent("글도 수정했어!!!");
		log.info("==========================================================");
		log.info("modify result....." + service.modify(board));
	}
	
	@Test
	public void testDelete() {
		
		log.info("==========================================================");
		log.info(service.remove(1L));
	}
	
//	@Test
//	public void testGetList() {
//		
//		log.info("==========================================================");
//		service.getList().forEach(board -> log.info(board));
//	}
	
}
