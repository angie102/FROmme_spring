package com.fromme.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVO {
	private int post_no;
	private String post_title;
	private String post_content;
	private String post_date;
	private String users_id;
	private int category_no;
	private int post_views;
	private int post_pub;
}


