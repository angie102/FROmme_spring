package com.fromme.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

//예외사항을 전부 핸들링해야 한다면 중복적이고 많은 양의 코드를 작성해야 하지만,
//공통적인 예외사항에 대해서는 별도로 @ControllerAdvice를 이용해서 분리한다(모듈화)
//이러한 방식이 AOP를 이용하는 방식이다.
@ControllerAdvice //해당 객체가 스프링 컨트롤러에서 발생하는 예외를 처리하는 존재임을 명시한다.
@Log4j
public class CommonExceptionAdvice {
	@ExceptionHandler(Exception.class) //소괄호에 들어가는 예외 타입을 처리
	public String except(Exception e, Model model) {
		log.error("Exception..........." + e.getMessage());
		model.addAttribute("exception", e);
		return "board/error_page";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException nhfe) {
		return "board/error_page";
	}
}














