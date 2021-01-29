package com.fromme.domain;

import lombok.Data;

@Data
public class ClassesPageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	
	private int total;
	
	private ClassesCriteria cri;
	
	 public ClassesPageDTO(ClassesCriteria cri, int total) {
		 this.cri = cri;
		 this.total = total;
		 
		 this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		 this.startPage = endPage-9;
		 this.realEnd = (int)(Math.ceil (total *1.0 / cri.getAmount() ) );
		 
		 if(realEnd < this.endPage) {
			 this.endPage = realEnd;
		 }
	 }
}
