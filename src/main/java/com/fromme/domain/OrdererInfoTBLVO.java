package com.fromme.domain;

import lombok.Data;

@Data
public class OrdererInfoTBLVO {
	private int ordererInfoNo;
	private String ordererName; 
	private String ordererPhone;  
	private String ordererEmail;
	private int totalPrice;
	private String payType;
	
}
