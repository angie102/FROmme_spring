package com.fromme.domain;

import lombok.Data;

@Data
public class UsersVO {
	private int usersNo;
	private String usersId;
	private String usersPw;
	private String usersName;
	private String usersPhone;
	private String usersEmail;
	private String usersAuthority;
	private int genreNo;
	private String usersAddress;
	private String usersAddressDetail;
	private String usersZipcode;
	private int studioNo;
}
