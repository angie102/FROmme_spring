package com.fromme.controller;

import jdk.internal.instrumentation.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fromme.domain.UserVO;
import com.fromme.service.AdminService;
import com.fromme.util.Utils;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/*")
@Log4j
@Controller
public class AdminController {
	
	//DI
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	//인덱스 
	@GetMapping("/index")
	public void index(Model model) {
		model.addAttribute("today", service.getChartData("class", "hh24"));
		model.addAttribute("week", service.getWeekChartData("class", "DD"));
		model.addAttribute("views", service.getIndexView());
		//클래스 리스트
		model.addAttribute("classList", null);
		model.addAttribute("tax", service.getIndexReserve() * 0.1);
		model.addAttribute("reserve", service.getIndexReserve());
		model.addAttribute("totalReserve", service.getIndexTotalReserve());
		
	}
	
	//공방 관련 
	@GetMapping("/studioList")
	public void studioList(int page, Model model) {
		model.addAttribute("page", page);
		//스튜디오 완성돠ㅣ면 작업 
		//model.addAttribute("list", service.get);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{studio_no}", 
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyStudioState(@PathVariable("studio_no") int studio_no, @PathVariable("auth") int authority) {
    log.info("studio state change : "+ studio_no);
		return service.setStudioAuthority(authority, studio_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//클래스 관련
	@GetMapping("/classList")
	public void classList(int page, Model model) {
		model.addAttribute("page", page);
		
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/class/visibility/{classes_no}/{visibility}", 
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> classVisibility(@PathVariable("classes_no") int classes_no, @PathVariable("visibility") int visibility) {
		log.info("classes visibilty changed : "+ classes_no + visibility);
		return service.setClassState(classes_no, visibility) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//유저 관련 
	@GetMapping("/userList")
	public void userList(int page, Model model) {
		model.addAttribute("page", page);
	}
	
	//유저 비밀번호 날리기 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/user/reset/{user_id}", 
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> passwordReset(@PathVariable("user_id") String user_id) {
		log.info("user password Reset : "+ user_id);
		return service.resetPassword(user_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//유저 정보 바꾸기 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/user/modify/{user_id}", 
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyUser(@RequestBody UserVO user, @PathVariable String user_id) {
		log.info("user info changed : "+ user);
		return service.setUserInfo(user) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//유저 비활성화 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/user/private/{user_no}/{user_authority}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> setPrivate(@PathVariable("user_no") int user_no, @PathVariable("user_authority") int user_authority) {
		log.info("user disabled : "+ user_no);
		return service.setUserState(user_no, user_authority) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//게시판 관련 
	@GetMapping("/boardList")
	public void boardList(int page, int category, Model model) {
		model.addAttribute("page", page);
		//model.addAttribute("", page);
		
	}
	
	//차트 데이터 ajax
	@GetMapping(value="/chart/{chart}/{date}", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> chartData(@PathVariable("chart") String chart, @PathVariable("date") String date) {
		log.info("chart data : +"+chart);
		return new ResponseEntity<>(service.getChartData(chart, date), HttpStatus.OK);
			
	}
}
