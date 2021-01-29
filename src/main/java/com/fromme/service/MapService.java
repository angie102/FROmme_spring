package com.fromme.service;

import java.util.List;

import com.fromme.domain.Criteria;
import com.fromme.domain.StudioVO;

public interface MapService {
	public String getUserAddress(String users_id);
	
	public List<StudioVO> getFindGongBangList(String search, Criteria cri);
	
	public int getFindGongBangListCount(String search);
}
