package com.fromme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fromme.domain.Criteria;
import com.fromme.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getListWithPaging(@Param("post_no") int post_no, @Param("cri") Criteria cri);
	
	public int insertBoardReply(ReplyVO reply);
	
	public int updateBoardReply(ReplyVO reply);
	
	public int deleteBoardReply(int replys_no);
	
	public void deleteBoardReplyAll(int post_no);
	
	public int getCurrentReplySeq();
	
	public ReplyVO getReplyDetail(int replys_no);
	
	public int getTotal(int post_no);
}
