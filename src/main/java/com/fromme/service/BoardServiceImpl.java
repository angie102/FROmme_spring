package com.fromme.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fromme.domain.Criteria;
import com.fromme.domain.FilesVO;
import com.fromme.domain.PostVO;
import com.fromme.domain.PostViewVO;
import com.fromme.mapper.BoardMapper;
import com.fromme.mapper.FilesMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private FilesMapper f_mapper;
	
	private static String[] filePath = {
			"C:\\Users\\soonho\\Desktop\\it\\SPRING\\workspace\\Fromme\\src\\main\\webapp\\resources\\files\\uploadFile",
			"C:\\Users\\soonho\\Desktop\\it\\SPRING\\workspace\\Fromme\\src\\main\\webapp\\resources\\files\\summernote"
	};
	
	//전체 파일 가져오기
	@Override
	public List<FilesVO> getFiles(int post_no){
		return f_mapper.getFiles(post_no);
	}
	
	//파일 경로에 저장
	@Override
	public String saveFile(MultipartFile uploadFile, int type) throws IOException {
		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + uploadFile.getOriginalFilename();
		
		log.info("saveName: " + saveName);
		
		File saveFile = new File(filePath[type], saveName);
		// 저장할 File 객체를 생성(껍데기 파일)
		FileCopyUtils.copy(uploadFile.getBytes(), saveFile);	//덮어쓰기
		uploadFile.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘

		return saveName;
	}
	
	//파일 DB,폴더에 저장
	@Override
	public void uploadFile(int post_no, MultipartFile[] uploadFiles) throws IOException {
		for(int i=0;i<uploadFiles.length;i++) {
			//만약 넘어온 file 태그가 비어있다면 continue;
			if(uploadFiles[i].isEmpty()) continue;
			FilesVO file = new FilesVO();
			file.setPost_no(post_no);
			//저장된 경로의 Path
			file.setImage_path(saveFile(uploadFiles[i], 0));
			//DB에 파일 추가
			f_mapper.insertFile(file);
			//파일 경로에 저장
			File saveFile = new File(filePath[0], file.getImage_path()); // 저장할 폴더 이름, 저장할 파일 이름
			FileCopyUtils.copy(uploadFiles[i].getBytes(), saveFile);	//덮어쓰기
			uploadFiles[i].transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		}
	}
	
	//전달받은 본문에서 이미지 태그의 파일명을 추출해서 DB에 저장
	public void insertImagesFileNameFromPostContent(PostVO post) {
		// 이미지 태그를 추출하기 위한 정규식.
		// 이미지 src 속성을 추출
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		// 내용 중에서 이미지 태그 찾기
		log.info("post.getPost_content() : " + post.getPost_content());
		Matcher match = pattern.matcher(post.getPost_content());
		FilesVO file = new FilesVO();
		file.setPost_no(post.getPost_no());
		
		while(match.find()) {// 이미지 태그가 있다면
			//이미지 src중 파일명만 추출 
			//String imageFileName = "board_" + match.group(1).substring(match.group(1).lastIndexOf("/") + 1, match.group(1).lastIndexOf("\n")-1);
			String imageFileName = "board_" + match.group(1).substring(match.group(1).lastIndexOf("/") + 1);
			System.out.println(imageFileName);
			file.setImage_path(imageFileName);
			f_mapper.insertFile(file);
		}
	}
	
	//전달받은 본문에서 동영상 태그의 url을 추출해서 DB에 저장
	public void insertVideoUrlFromPostContent(PostVO post) {
		String url = null;
		Pattern pattern = Pattern.compile("<iframe[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		FilesVO file = new FilesVO();
		file.setPost_no(post.getPost_no());
		log.info("post.getPost_content() : " + post.getPost_content());
		// 내용 중에서 iframe 태그 찾기
		Matcher match = pattern.matcher(post.getPost_content());
		if(match.find()) {// iframe 태그가 있다면
			//iframe src를 추출한 뒤 iframe 접두사를 붙여 저장합니다.
			url = "video_" + match.group(1);
			file.setImage_path(url);
			f_mapper.insertFile(file);
		}
	}
	
	//경로에 있는 파일 삭제
	public void deleteFile(int post_no) {
		List<FilesVO> files = getFiles(post_no);
		for(FilesVO file : files) {
			File temp = new File(filePath[0] + "\\" + file.getImage_path());
			//해당 경로에 파일이 있다면 삭제
			if(temp.exists()) temp.delete();
		}
	}
	
	@Override
	public int getAuthority(String users_id) {
		return users_id.equals("") ? 1 : mapper.getAuthority(users_id);
	}
	
	@Override
	public List<PostViewVO> listAll(Criteria cri) {
		log.info("BoardMapper listAll...");
		return mapper.listAll(cri);
	}

	@Override
	public List<PostViewVO> getBoardListByUser(Criteria cri, String users_id) {
		return mapper.getBoardListByUser(cri, users_id);
	}

	@Override
	public int getBoardListCountByUser(Criteria cri, String users_id) {
		return mapper.getBoardListCountByUser(cri, users_id);
	}

	@Override
	public int getReplyCountByUser(String users_id) {
		return mapper.getReplyCountByUser(users_id);
	}

	@Override
	public List<PostViewVO> getBoardImageList(Criteria cri) {
		return mapper.getBoardImageList(cri);
	}

	@Override
	public int boardListCount(Criteria cri) {
		return mapper.boardListCount(cri);
	}

	@Override
	public String getBoardCategoryName(int category_no) {
		return mapper.getBoardCategoryName(category_no);
	}

	@Override
	public int getCurrentBoardSeq() {
		return mapper.getCurrentBoardSeq();
	}

	@Override
	public void updateReadCount(int post_no) {
		mapper.updateReadCount(post_no);
	}

	@Override
	public void insertBoard(PostVO post, MultipartFile[] uploadFiles) throws IOException {
		mapper.insertSelectKey_post_no(post);
		//파일 추가
		uploadFile(post.getPost_no(), uploadFiles);
		//본문에 첨부된 summernote 이미지, video 태그 DB에 저장
		insertImagesFileNameFromPostContent(post);
		insertVideoUrlFromPostContent(post);
	}

	@Override
	public int updateBoard(PostVO post, MultipartFile[] uploadFiles) throws IOException {
		//폴더에 있는 기존 파일 삭제
		deleteFile(post.getPost_no());
		//DB에 있는 기존 파일 삭제
		f_mapper.deleteFile(post.getPost_no());
		//파일 추가
		uploadFile(post.getPost_no(), uploadFiles);
		//본문에 첨부된 summernote 이미지, video 태그 DB에 저장
		insertImagesFileNameFromPostContent(post);
		insertVideoUrlFromPostContent(post);
		return mapper.updateBoard(post);
	}

	@Override
	public void updateHideBoard(int post_no) {
		mapper.updateHideBoard(post_no);
	}

	@Override
	public void updateShowBoardAll(int start_no, int end_no) {
		mapper.updateShowBoardAll(start_no, end_no);
	}

	@Override
	public int deleteBoard(int post_no) {
		//폴더에 있는  파일 삭제
		deleteFile(post_no);
		//DB에 있는 파일 삭제
		f_mapper.deleteFile(post_no);
		return mapper.deleteBoard(post_no);
	}
	
	@Override
	public PostVO getDetail(int post_no) {
		System.out.println("BoardServiceImpl : " + post_no);
		return mapper.getDetail(post_no);
	}

	@Override
	public PostVO getNextBoard(Criteria cri, int post_no, String users_id) {
		if(users_id != null) {
			if(cri.getField().equals("board")) 
				return mapper.getNextBoardByUserboard(cri, post_no);
			else
				return mapper.getNextBoardByUserreply(cri, post_no, users_id);
		}
		if(cri.getSort().equals("date".toUpperCase())) {
			if(cri.getKeyword() != null && !cri.getKeyword().equals("")) 
				return mapper.getNextBoardSearchedAndSortedBydate(cri, post_no);
			else
				return mapper.getNextBoardSortedBydate(cri, post_no);
		}else {
			if(cri.getKeyword() != null && !cri.getKeyword().equals("")) {
				return mapper.getNextBoardSearchedAndSortedByviews(cri, post_no);
			} else
				return mapper.getNextBoardSortedByviews(cri, post_no);
		}
	}

	@Override
	public PostVO getPrevBoard(Criteria cri, int post_no, String users_id) {
		if(users_id != null) {
			if(cri.getField().equals("board"))
				return mapper.getPrevBoardByUserboard(cri, post_no);
			else
				return mapper.getPrevBoardByUserreply(cri, post_no, users_id);
		}
		
		if(cri.getSort().equals("date".toUpperCase())) {
			if(cri.getKeyword() != null && !cri.getKeyword().equals(""))
				return mapper.getPrevBoardSearchedAndSortedBydate(cri, post_no);
			else 
				return mapper.getPrevBoardSortedBydate(cri, post_no);
		}else {
			if(cri.getKeyword() != null && !cri.getKeyword().equals(""))
				return mapper.getPrevBoardSearchedAndSortedByviews(cri, post_no);
			else 
				return mapper.getPrevBoardSortedByviews(cri, post_no);
		}
	}




}
