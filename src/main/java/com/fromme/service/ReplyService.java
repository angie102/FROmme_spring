package com.fromme.service;

import com.fromme.domain.Criteria;
import com.fromme.domain.ReplyPageDTO;
import com.fromme.domain.ReplyVO;

public interface ReplyService {
	public ReplyPageDTO getReply(int post_no, Criteria cri);
	
	public int insertBoardReply(ReplyVO reply);
	
	public int updateBoardReply(ReplyVO reply);
	
	public int deleteBoardReply(int replys_no);
	
	public void deleteBoardReplyAll(int post_no);
	
	public int getCurrentReplySeq();
	
	public ReplyVO getReplyDetail(int replys_no);
}
