package com.fromme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fromme.domain.Criteria;
import com.fromme.domain.StudioVO;
import com.fromme.mapper.StudioMapper;
import com.fromme.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MapServiceImpl implements MapService {

	@Setter(onMethod_ = @Autowired)
	private StudioMapper s_mapper;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper u_mapper;
	
	public String getUserAddress(String users_id) {
		log.info("MapServiceImpl.getUserAddress...");
		return u_mapper.getUserAddress(users_id);
	}
	
	public List<StudioVO> getFindGongBangList(String search, Criteria cri){
		log.info("MapServiceImpl.getFindGongBangList...");
		return s_mapper.getFindGongBangList(search, cri);
	}
	
	public int getFindGongBangListCount(String search) {
		log.info("MapServiceImpl.getFindGongBangListCount...");
		return s_mapper.getGongbangListCountBySearchWord(search);
	}
}
