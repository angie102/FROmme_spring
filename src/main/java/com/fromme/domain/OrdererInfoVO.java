package com.fromme.domain;

import lombok.Data;

@Data
public class OrdererInfoVO {
	private int ordererInfoNo;
	private String ordererName; 
	private String ordererPhone;  
	private String ordererEmail;
	private int totalPrice;
	
}
