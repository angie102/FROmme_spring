package com.fromme.domain;

import lombok.Data;

@Data

public class UserListVO extends UserVO{
	private int users_ReservationCnt;
	private int users_Amount;
	private int users_PostCnt;
	private int users_ReplyCnt;
		
}
