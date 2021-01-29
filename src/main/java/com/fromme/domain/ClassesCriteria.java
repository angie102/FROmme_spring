package com.fromme.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class ClassesCriteria {
	private int pageNum;
	private int amount;
	
	private String typeCheck;
	private String type;
	private String keyword;
	private Integer genreType;
	
	public ClassesCriteria() {
		this(1, 16);
	}
	public ClassesCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() { 
		return 	type == null ? new String[] {} : type.split(""); 
	}
	

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("typeCheck", this.typeCheck)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword)
				.queryParam("genreType", this.genreType);
				
		return builder.toUriString();
	}
}







