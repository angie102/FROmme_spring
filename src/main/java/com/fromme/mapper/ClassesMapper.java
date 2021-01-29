package com.fromme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.fromme.domain.ClassesCriteria;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.ClassesVO;
import com.fromme.domain.GenreVO;
import com.fromme.domain.LikeitVO;
import com.fromme.domain.StudioVO;

public interface ClassesMapper {
	public List<ClassesVO> getListWithPaging(ClassesCriteria cri);
	public int getTotal(ClassesCriteria cri);
	public List<GenreVO> getGenre();
	public ClassesVO getDetail(int classesNo);
	public List<StudioVO> getStudio();
	
	public List<String> getClassesDate(int classesNo);
	public ClassesInfoVO getClassesInfoByDate(ClassesInfoVO ci_vo);
	
	public int updateLike(LikeitVO l_vo);
	public int updateClassesLike(LikeitVO l_vo);
	public int insertLike(LikeitVO l_vo);
	public List<LikeitVO> getLikes(String userId);

	public ClassesInfoVO getClassesInfoByNo(int classesInfoNo);
	public int updateState(int classesNo);
	public int updateNum(ClassesInfoVO ci_vo);
}
