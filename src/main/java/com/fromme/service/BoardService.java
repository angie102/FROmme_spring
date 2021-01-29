package com.fromme.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fromme.domain.Criteria;
import com.fromme.domain.FilesVO;
import com.fromme.domain.PostVO;
import com.fromme.domain.PostViewVO;

public interface BoardService {
	
	//전체 파일 가져오기
	public List<FilesVO> getFiles(int post_no);
	
	public String saveFile(MultipartFile file, int type) throws IOException;
	
	public void uploadFile(int post_no, MultipartFile[] file) throws IOException;
	
	public int getAuthority(String users_id);
	
	public List<PostViewVO> listAll(Criteria cri);
	
	public List<PostViewVO> getBoardListByUser(Criteria cri, String users_id);
	
	public int getBoardListCountByUser(Criteria cri, String users_id);
		
	public int getReplyCountByUser(String users_id);
	
	public List<PostViewVO> getBoardImageList(Criteria cri);
	
	public int boardListCount(Criteria cri);
	
	public String getBoardCategoryName(int category_no);
	
	public int getCurrentBoardSeq();
	
	public void updateReadCount(int post_no);
	
	public void insertBoard(PostVO post, MultipartFile[] uploadFiles) throws IOException;
	
	public int updateBoard(PostVO post, MultipartFile[] uploadFiles) throws IOException;
	
	public void updateHideBoard(int post_no);
	
	public void updateShowBoardAll(int start_no, int end_no);
	
	public int deleteBoard(int post_no);
	
	public PostVO getDetail(int post_no);
	
	public PostVO getNextBoard(Criteria cri, int post_no, String users_id);
	
	public PostVO getPrevBoard(Criteria cri, int post_no, String users_id);
}
	
