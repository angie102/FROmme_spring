package com.fromme.controller;


import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;

import com.fromme.domain.CartListVO;
import com.fromme.service.KakaoPayTest;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/payment/*")
public class PayController {
	@Setter(onMethod_= {@Autowired})
	 private KakaoPayTest kakaoPay;
	 
	@PostMapping("/kakaoPay")
	public String kakaoPay(CartListVO cart) throws RestClientException, URISyntaxException {
		log.info("kakaoPay Rest Controller");
        return "redirct:"+kakaoPay.ready(cart);
	}
	  
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) throws RestClientException, URISyntaxException{
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        model.addAttribute("orderInfo", kakaoPay.success(pg_token));
        return "classes/paySuccess";
    }
}
