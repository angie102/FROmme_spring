package com.fromme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fromme.domain.Criteria;
import com.fromme.domain.ReplyPageDTO;
import com.fromme.domain.ReplyVO;
import com.fromme.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public ReplyPageDTO getReply(int post_no, Criteria cri) {
		return new ReplyPageDTO(mapper.getTotal(post_no), mapper.getListWithPaging(post_no, cri));
	}

	@Override
	public int insertBoardReply(ReplyVO reply) {
		return mapper.insertBoardReply(reply);
	}

	@Override
	public int updateBoardReply(ReplyVO reply) {
		return mapper.updateBoardReply(reply);
	}

	@Override
	public int deleteBoardReply(int replys_no) {
		return mapper.deleteBoardReply(replys_no);
	}

	@Override
	public void deleteBoardReplyAll(int post_no) {
		mapper.deleteBoardReplyAll(post_no);
	}

	@Override
	public int getCurrentReplySeq() {
		return mapper.getCurrentReplySeq();
	}

	@Override
	public ReplyVO getReplyDetail(int replys_no) {
		return mapper.getReplyDetail(replys_no);
	}

}
