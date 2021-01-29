package com.fromme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fromme.domain.Criteria;
import com.fromme.domain.StudioVO;

public interface StudioMapper {
	public List<StudioVO> getFindGongBangList(@Param("search")String search, @Param("cri") Criteria cri);
	
	public int getGongbangListCountBySearchWord(String search);
}
