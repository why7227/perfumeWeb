package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mock;
	
	
	@Before
	public void setup() {
		this.mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
		mock.perform(MockMvcRequestBuilders.get("/board/list")
		.param("pageNum","1")
		.param("amount","10"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
	}
	
	@Test
	public void restRegister() throws Exception {
		
		String resultPage = mock.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title","향기 짱짱")
				.param("content","대박인걸?")
				.param("writer","송택민"))
				.andReturn()
				.getModelAndView()
				.getViewName();
				
		log.info(resultPage);		
	}
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mock.perform(MockMvcRequestBuilders
			.get("/board/content")
			.param("bno","2"))
			.andReturn()
			.getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mock.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno","5")
				.param("title", "수정된 테스트 새글 제목!!!!!!!")
				.param("content", "수정된 테스트 새글 내용!!!!!")
				.param("writer", "김상곤"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {

		String resultPage = mock.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "5"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info(resultPage);
	}
}
