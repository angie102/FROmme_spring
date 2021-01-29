package com.fromme.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fromme.service.ClassesService;
import com.fromme.domain.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/cart/*")
@Log4j

public class CartRestController {
	@Setter(onMethod_ = {@Autowired})
	private ClassesService service;
	
	@PostMapping(value="/new", consumes="application/json",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> create(@RequestBody CartVO cart){
		log.info("create..........");
		return service.addCart(cart) 
					? new ResponseEntity<>("success",HttpStatus.OK)
					 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{cartNo}",
			consumes="application/json", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> modify(@RequestBody CartVO cart){
		log.info("modify..........");
		return service.modifyQuantity(cart) ? new ResponseEntity<>("success", HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	

	@DeleteMapping(value="/{cartNo}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("cartNo") int cartNo){
		log.info("remove..........");
		return service.removeCart(cartNo) ? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
