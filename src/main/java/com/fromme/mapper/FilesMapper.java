package com.fromme.mapper;

import java.util.List;

import com.fromme.domain.FilesVO;

public interface FilesMapper {
	
	//전체 파일 가져오기
	public List<FilesVO> getFiles(int post_no);
	
	//파일 추가
	public int insertFile(FilesVO file);
	
	//파일 삭제
	public void deleteFile(int post_no);
	
}
