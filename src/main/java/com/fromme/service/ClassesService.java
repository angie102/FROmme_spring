package com.fromme.service;

import java.util.List;
import java.util.Map;

import com.fromme.domain.CartListVO;
import com.fromme.domain.CartVO;
import com.fromme.domain.ClassesCriteria;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.ClassesVO;
import com.fromme.domain.LikeitVO;
import com.fromme.domain.OrderListTBLVO;
import com.fromme.domain.OrdererInfoTBLVO;
import com.fromme.domain.UsersVO;

public interface ClassesService {

	public List<ClassesVO>  getList(ClassesCriteria cri);
	public int getTotal(ClassesCriteria cri);
	public Map<Integer, String> getGenreMap();
	public Map<Integer, String> getStudioMap();
	public ClassesVO getClassDetailMap(int classesNo);

	public List<String> getAvailableDate(int classesNo);
	public ClassesInfoVO getInfoWhenDateSelected(ClassesInfoVO ci_vo);
	
	public Map<Integer, Integer> getLikeMap(String usersId);
	public boolean updateLikeCnt(LikeitVO l_vo);

	public List<CartListVO> getCartList(String usersId);
	public boolean addCart(CartVO cart);
	public boolean modifyQuantity(CartVO cart);
	public boolean removeCart(int cartNo);
	
	public UsersVO usersInfoForOrder(String usersId);
	
	public int getLastestOrdererNo();
	public ClassesInfoVO getClassesInfoByNo(int classesInfoNo);
	public boolean insertOrdererInfo(OrdererInfoTBLVO oi_vo);
	public boolean insertOrderList(OrderListTBLVO ol_vo);
	public boolean updateClassesStateAndNum(int classesNo);
	public boolean updateClassesInfoStateAndNum(ClassesInfoVO ci_vo);
	
}
