package com.fromme.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Criteria {
	private int category_no;
	private int pageNum;
	private int amount;
	private String sort;
	private String list_type;
	private int users_authority;
	private String category_name;
	
	private String field;
	private String keyword;
	
	public Criteria() {
		this(1, 1, 10, "date", "text");
	}
	public Criteria(int category_no, int pageNum, int amount, String sort, String list_type) {
		this.category_no = category_no;
		this.pageNum = pageNum;
		this.amount = amount;
		this.sort = sort.toUpperCase();
		this.list_type = list_type;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("category_no", this.category_no)
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("sort", this.sort)
				.queryParam("field", this.field)
				.queryParam("keyword", this.keyword)
				.queryParam("category_name", this.category_name)
				.queryParam("list_type", this.list_type);
				
		return builder.toUriString();
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
