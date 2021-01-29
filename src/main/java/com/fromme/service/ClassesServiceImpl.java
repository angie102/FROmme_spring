package com.fromme.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fromme.domain.CartListVO;
import com.fromme.domain.CartVO;
import com.fromme.domain.ClassesCriteria;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.ClassesVO;
import com.fromme.domain.GenreVO;
import com.fromme.domain.LikeitVO;
import com.fromme.domain.OrderListTBLVO;
import com.fromme.domain.OrdererInfoTBLVO;
import com.fromme.domain.StudioVO;
import com.fromme.domain.UsersVO;
import com.fromme.mapper.CartMapper;
import com.fromme.mapper.ClassesMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor	
public class ClassesServiceImpl implements ClassesService {
	//DI
	@Setter(onMethod_ = {@Autowired})
	private ClassesMapper classesMapper;
	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;


	@Override
	public List<ClassesVO> getList(ClassesCriteria cri) {
		return classesMapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(ClassesCriteria cri) {
		return classesMapper.getTotal(cri);
	}

	@Override
	public Map<Integer, String> getGenreMap () {
		Map<Integer, String> genreMap = new HashMap<>();
		List<GenreVO> list = classesMapper.getGenre();
		list.forEach( g_vo -> {
			genreMap.put(g_vo.getGenreNo(), g_vo.getGenreName()); 
		});
		return genreMap;
	}
	
	@Override
	public Map<Integer, String> getStudioMap() {
		Map<Integer, String> studioMap = new HashMap<>();
		List<StudioVO> list = classesMapper.getStudio();
		list.forEach( g_vo -> {
			studioMap.put(g_vo.getStudioNo(), g_vo.getStudioName() ); 
		});
		return studioMap;
	}
	
	@Override
	public ClassesVO getClassDetailMap(int classesNo) {
		return classesMapper.getDetail(classesNo);
	}
	
	@Override
	public List<String> getAvailableDate(int classesNo) {
		return classesMapper.getClassesDate(classesNo);
	}
	
	@Override
	public Map<Integer, Integer> getLikeMap(String userId) {
		Map<Integer, Integer> likeMap = new HashMap<>();
		List<LikeitVO> list = classesMapper.getLikes(userId);
		list.forEach( l_vo -> {
			likeMap.put(l_vo.getClassesNo(), l_vo.getLikeCnt() ); 
		});
		return likeMap;
	}

	@Override
	public boolean updateLikeCnt(LikeitVO l_vo) {
		if(classesMapper.updateLike(l_vo) ==1 && classesMapper.updateClassesLike(l_vo) ==1 ) return true;
		return false;
	}
	
	@Override
	public ClassesInfoVO getInfoWhenDateSelected(ClassesInfoVO ci_vo) {
		return classesMapper.getClassesInfoByDate(ci_vo);
	}

	@Override
	public List<CartListVO> getCartList(String usersId) {
		return cartMapper.selectCart(usersId);
	}

	@Override
	public boolean addCart(CartVO cart) {
		
		boolean check = false;
		if(cartMapper.countCart(cart)!=0) {
			if(cartMapper.updateCart(cart)==1) check = true;
		}else {
			if(cartMapper.insertCart(cart)==1) check = true;
		}
		return check;
	}

	@Override
	public boolean modifyQuantity(CartVO cart) {
		if(cartMapper.updateQuantity(cart)==1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean removeCart(int cartNo) {
		if(cartMapper.deleteCart(cartNo)==1)	return true;
		return false;
	}

	
	@Override
	public int getLastestOrdererNo() {
		return cartMapper.getOrdererNo();
	}
	@Override
	public UsersVO usersInfoForOrder(String usersId) {
		return cartMapper.getUsersNamePhoneEmail(usersId);
	}

	
	@Override
	public ClassesInfoVO getClassesInfoByNo(int classesInfoNo) {
		return classesMapper.getClassesInfoByNo(classesInfoNo);
	}
	
	@Override
	public boolean insertOrdererInfo(OrdererInfoTBLVO oi_vo) {
		if(cartMapper.insertOrderInfo(oi_vo) ==1){			
			return true;
		}
		return false;
	}
	@Override
	public boolean insertOrderList(OrderListTBLVO ol_vo) {
		if(cartMapper.insertOrderList(ol_vo) ==1){			
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateClassesStateAndNum(int classesNo) {
		if(classesMapper.updateState(classesNo)==1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean updateClassesInfoStateAndNum(ClassesInfoVO ci_vo) {
		if(classesMapper.updateNum(ci_vo)==1 ) {
			return true;
		}
		return false;
	}
		
}
