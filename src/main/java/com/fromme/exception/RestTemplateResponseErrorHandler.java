package com.fromme.exception;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class RestTemplateResponseErrorHandler implements ResponseErrorHandler {
	private static final Logger log = LoggerFactory.getLogger(JdbcTemplate.class);
	
    @Override
    public boolean hasError(ClientHttpResponse response) throws IOException {
    	log.error("RestTemplateResponseErrorHandler hasError..........." + response);

    	boolean hasError = false;
        int rawStatusCode = response.getRawStatusCode();
        if (rawStatusCode != 200){
            hasError = true;
        }
        return hasError;
     }

    @Override
    public void handleError(ClientHttpResponse response) throws IOException {
    	log.error("RestTemplateResponseErrorHandler handleError..........." + response);
    	
   }
    private void traceResponse(ClientHttpResponse response) throws IOException {
    	StringBuilder inputStringBuilder = new StringBuilder();
    	BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getBody(), "UTF-8"));
    	String line = bufferedReader.readLine();
    	while (line != null) {
    	inputStringBuilder.append(line);
    	inputStringBuilder.append('\n');
    	line = bufferedReader.readLine();
    	}
    	System.out.println("============================response begin==========================================");
    	System.out.println("Status code : " + response.getStatusCode());
    	System.out.println("Status text : " + response.getStatusText());
    	System.out.println("Headers : " + response.getHeaders());
    	System.out.println("Response body: " + inputStringBuilder.toString());
    	System.out.println("=======================response end=================================================");
    	}
    public static void main(String args[]) {
    	  RestTemplate restTemplate = new RestTemplate();
    	  restTemplate.setErrorHandler(new RestTemplateResponseErrorHandler());
    	}
}
