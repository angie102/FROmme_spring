package com.fromme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fromme.domain.Criteria;
import com.fromme.domain.PostVO;
import com.fromme.domain.PostViewVO;

public interface BoardMapper {
	
	//회원 권한
	public int getAuthority(String users_id);
	
	//전체 게시물
	public List<PostViewVO> listAll(@Param("cri") Criteria cri);
	
	//회원 게시물
	public List<PostViewVO> getBoardListByUser(@Param("cri") Criteria cri, @Param("users_id") String users_id);
	
	//회원 게시물 개수
	public int getBoardListCountByUser(@Param("cri") Criteria cri, @Param("users_id") String users_id);
		
	//회원이 작성한 댓글이 있는 게시글 개수
	public int getBoardCountByUserReply(String users_id);
	
	//회원 댓글 개수
	public int getReplyCountByUser(String users_id);
	
	//게시글 이미지 리스트
	public List<PostViewVO> getBoardImageList(@Param("cri") Criteria cri);
	
	//게시글 개수
	public int boardListCount(@Param("cri") Criteria cri);
	
	//카테고리 이름
	public String getBoardCategoryName(int categoryNum);
	
	//현재 게시글 번호
	public int getCurrentBoardSeq();
	
	//게시글 조회수 증가
	public void updateReadCount(int post_no);
	
	//게시글 삽입
	public int insertBoard(PostVO post);
	
	//게시글 삽입(전에 post_no 가져오기)
	public int insertSelectKey_post_no(PostVO post);
	
	//게시글 수정
	public int updateBoard(PostVO post);
	
	//게시글 삭제
	public int deleteBoard(int post_no);
	
	//게시글 상세보기
	public PostVO getDetail(int post_no);
	
	//게시글 숨기기
	public void updateHideBoard(int post_no);
	
	//게시글 보여주기
	public void updateShowBoardAll(int start_no, int end_no);
	
	public PostVO getNextBoardByUserboard(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getPrevBoardByUserboard(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getNextBoardByUserreply(@Param("cri") Criteria cri, @Param("post_no") int post_no, @Param("users_id") String users_id);
	
	public PostVO getPrevBoardByUserreply(@Param("cri") Criteria cri, @Param("post_no") int post_no, @Param("users_id") String users_id);
	
	public PostVO getNextBoardSearchedAndSortedBydate(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getPrevBoardSearchedAndSortedBydate(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getNextBoardSearchedAndSortedByviews(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getPrevBoardSearchedAndSortedByviews(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getNextBoardSortedBydate(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getPrevBoardSortedBydate(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getNextBoardSortedByviews(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	public PostVO getPrevBoardSortedByviews(@Param("cri") Criteria cri, @Param("post_no") int post_no);
	
	
}
