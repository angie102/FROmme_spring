package com.fromme.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderListTBLVO {
	private int orderlistNo;
	private String usersId;
	private String orderlistDate;
	private String paymentDate;
	private int orderlistStateNo;
	private int classesInfoNo;
	private int quantity;
	private int reservationNo = 0;
	private int ordererInfoNo;
	
	
	public OrderListTBLVO(String usersId, int classesInfoNo, int quantity, int ordererInfoNo, String payType){
		this.usersId = usersId;
		this.classesInfoNo = classesInfoNo;
		this.ordererInfoNo = ordererInfoNo;
		this.quantity = quantity;
		checkState(payType);
	}
	
	public void checkState(String payType) {
		//결제 대기
		if(payType.trim().equals("cash") ) {
			this.orderlistStateNo= 0;
		}else {
			//결제완료
			this.orderlistStateNo= 2; 
		}
	}


}
