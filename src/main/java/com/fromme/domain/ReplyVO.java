package com.fromme.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int post_no;
	private int replys_no;
	private String replys_id;
	private String replys_content;
	private String replys_date;
}


