package com.fromme.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fromme.service.ClassesService;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.LikeitVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/datas/*")
@Log4j

public class ClassesRestController {
	@Setter(onMethod_ = {@Autowired})
	private ClassesService service;
	
	//좋아요 클릭시 데이터 변경
	@RequestMapping(method= {RequestMethod.PATCH, RequestMethod.PUT}, value="/like/{userId}/{classesNo}", consumes="application/json", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> updateLike(@RequestBody LikeitVO l_vo){
		log.info("updateLike.............");
		return service.updateLikeCnt(l_vo) ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);  
	}
	//사용자가 선택한 날짜의 classesInfo 정보 가져오기
	@GetMapping(value="/{classesNo}/{classesDate}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ClassesInfoVO> selectAvailableNum(@PathVariable("classesNo") int classesNo, @PathVariable("classesDate") String classesDate, ClassesInfoVO ci_vo){
		return new ResponseEntity<>(service.getInfoWhenDateSelected(ci_vo), HttpStatus.OK);
	}

}
