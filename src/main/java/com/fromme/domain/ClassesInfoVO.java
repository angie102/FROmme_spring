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
			//���� �ʰ��� ��û �Ұ�
			return false;
		}else if(afterApplyNum == this.classesLimit) {
			//�ο� �߰� �� ���� ���� �� ����Ұ�
			this.classesIndividualState = 3; 
		}
		this.classesApplyNum = afterApplyNum;
		return true;
		
    }
}
