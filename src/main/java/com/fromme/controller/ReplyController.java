package com.fromme.controller;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.fromme.domain.Criteria;
import com.fromme.domain.ReplyPageDTO;
import com.fromme.domain.ReplyVO;
import com.fromme.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO reply){
		log.info("new...");
		log.info(reply);
		return service.insertBoardReply(reply) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{post_no}/{page}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("post_no") int post_no, @PathVariable("page") int page){
		log.info("getList...");
		return new ResponseEntity<ReplyPageDTO>(service.getReply(post_no, new Criteria(page, 10)), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{replys_no}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replys_no") int replys_no){
		log.info("remove...");
		return service.deleteBoardReply(replys_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="/{replys_no}",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE}, method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("replys_no") int replys_no, @RequestBody ReplyVO reply){
		log.info(replys_no);
		log.info(reply);
		reply.setPost_no(replys_no);
		return service.updateBoardReply(reply) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
