package com.fromme.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PostImageVO{
	private String image_path;
	private PostViewVO postViewVO;
}
