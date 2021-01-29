package com.fromme.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostViewVO {
	private int reply_count;
	private int users_authority;
	private String image_path;
	private List<PostVO> postVO;
}
