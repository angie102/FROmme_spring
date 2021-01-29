package com.fromme.domain;

import lombok.Data;

@Data
public class ClassesInfoVO {
	private int  classesNo; 
	private int classesInfoNo; 
    private String classesDate; 
    private int classesApplyNum; 
    private int classesLimit;
    private int classesIndividualState;
    
    public boolean checkAvailable(int cartQuantity) {
		int afterApplyNum = this.classesApplyNum + cartQuantity;
		if(afterApplyNum > this.classesLimit) {
			//정원 초과로 신청 불가
			return false;
		}else if(afterApplyNum == this.classesLimit) {
			//인원 추가 후 정원 도달 시 예약불가
			this.classesIndividualState = 3; 
		}
		this.classesApplyNum = afterApplyNum;
		return true;
		
    }
}
