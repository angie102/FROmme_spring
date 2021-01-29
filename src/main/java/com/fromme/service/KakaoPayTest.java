package com.fromme.service;


import java.net.URI;
import java.net.URISyntaxException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fromme.api.KakaoPayApproveVO;
import com.fromme.api.KakaoPayReadyVO;
import com.fromme.domain.CartListVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoPayTest {
	 private static final String HOST = "https://kapi.kakao.com";
	 private KakaoPayReadyVO kReady;
	 private KakaoPayApproveVO kApprove;
		private static final Logger log = LoggerFactory.getLogger(JdbcTemplate.class);
	 
	 
	
	public String ready(CartListVO cart) throws RestClientException, URISyntaxException {
		log.info("KakaoPay Ready............................................");
		 RestTemplate restTemplate = new RestTemplate();
		// Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", " KakaoAK "+"4aefb6bbc413662e93f5bb7a9035d7e7");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		
		// Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", cart.getUsersId());
        params.add("item_name", cart.getClassesName());
        params.add("quantity", cart.getCartQuantity()+"");
        params.add("total_amount", cart.getCartSumPrice()+"");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8081/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8081/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8081/kakaoPayFail");
        
        System.out.println("********HEADER"+headers);		
        System.out.println("********BODY"+params);		
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        System.out.println("*********request"+request);
        try {
        	kReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, KakaoPayReadyVO.class);
        	return kReady.getNext_redirect_pc_url();

        } catch (RestClientException rce) {
        	System.out.println("RestClientException getMessage"+ rce.getMessage());
        } catch (URISyntaxException use) {
        	System.out.println("URISyntaxException getMessage"+use.getMessage());
        }

        return "/orderFail";
	}
	
	public String success(String pg_token) throws RestClientException, URISyntaxException{
		log.info("KakaoPay Success............................................");
		RestTemplate restTemplate = new RestTemplate();
		//Header
        HttpHeaders headers = new HttpHeaders();
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		headers.add("Authorization", " KakaoAK "+"4aefb6bbc413662e93f5bb7a9035d7e7");

	    //  Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kApprove.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        	kApprove =restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproveVO.class);
            log.info("" + kApprove);
          
            return null;

    }
}
