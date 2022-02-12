package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@AllArgsConstructor
@Log4j
public class ReplyController {

	ReplyService service;

	// 등록
	@PostMapping(value = "/new",
	consumes = "application/json",
	produces = {MediaType.TEXT_PLAIN_VALUE})
public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
	log.info("ReplyDTO: " + dto);
	int insertCount = service.register(dto);
	log.info("Reply INSERT COUNT: " + insertCount);
	
	return insertCount == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
					:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정게시물 댓글목록 확인
	@GetMapping(value = "/pages/{bno}/{page}",
	produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyDTO>> getList(  @PathVariable("page") int page,
													@PathVariable("bno") Long bno) {
		
		log.info("getList...........");
		Criteria cri = new Criteria(page,20);
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, bno),HttpStatus.OK);
	}
	
	// 댓글 삭제,조회
	@GetMapping(value = "/{rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyDTO> get(@PathVariable("rno") Long rno) {
		log.info("get: " + rno);
		
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
			}
	
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		log.info("remove: " + rno);
		
		return service.remove(rno) == 1
				?new ResponseEntity<>("seccess",HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyDTO dto,
			@PathVariable("rno") Long rno) {
		dto.setRno(rno);
		log.info("rno: " + rno);
		log.info("modify: " + dto);
		return service.modify(dto) == 1
				?new ResponseEntity<>("success",HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
