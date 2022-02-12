package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

private Long[] bnoArr = {50L,51L,52L,53L};

@Setter(onMethod_ = @Autowired)
private ReplyMapper mapper;
	

@Test
public void testMapper() {
	log.info(mapper);
}
public void testCreate() {
	
	IntStream.rangeClosed(1, 10).forEach(i -> {
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBno(bnoArr[i % 5]);
		dto.setReply("댓글테스트" + i);
		dto.setReplyer("replyer" + i);
		
		mapper.insert(dto);
	});
}

@Test
public void testRead() {
	
	Long targetRno = 1L;
	ReplyDTO dto = mapper.read(targetRno);
	log.info(dto);
	}

@Test
public void testDelete() {
	
	Long targetRno = 1L;
	mapper.delete(targetRno);
	}

@Test 
public void testUpdate() {
	
	Long targetRno = 2L;
	ReplyDTO dto = mapper.read(targetRno);
	
	dto.setReply("수정댓글");
	
	int count = mapper.update(dto);
	log.info("update count: " + count);
	
}

@Test
public void testList() {
	Criteria cri = new Criteria();
	List<ReplyDTO> replies = mapper.getListWithPaging(cri, bnoArr[1]);
	replies.forEach(reply -> log.info(reply));
}
}
