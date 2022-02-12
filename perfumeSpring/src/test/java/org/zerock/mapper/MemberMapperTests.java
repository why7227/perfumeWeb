package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Test
	public void testinsertMember() {
		MemberDTO member = new MemberDTO();
		
		member.setName("가나다");
		member.setUserid("rkskek");
		member.setPwd("1234");
		member.setAddress("화성");
		member.setPhone("010-2528-7136");
		member.setAdmin(2);

		mapper.insertMember(member);

		log.info(member);
	}

	@Test
	public void testUpdateMember() {
		MemberDTO member = new MemberDTO();
		
		member.setPwd("1111");
		member.setAddress("우주안드로이드");
		member.setPhone("010-2222-2222");
		member.setAdmin(1);
		member.setUserid("7227");

		log.info(member);
	}
	
	@Test
	public void testConfirmID() {
		mapper.confirmID("why7227");
		mapper.confirmID("user");
	}
}
