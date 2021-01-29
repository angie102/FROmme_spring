package com.fromme.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String cartDate;
	private int cartQuantity;
	private String choiceDate;
	private int classesInfoNo;
	private int classesNo;
	private String usersId;
}
