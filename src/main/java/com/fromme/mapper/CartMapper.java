package com.fromme.mapper;

import java.util.List;

import com.fromme.domain.CartListVO;
import com.fromme.domain.CartVO;
import com.fromme.domain.OrderListTBLVO;
import com.fromme.domain.OrdererInfoTBLVO;
import com.fromme.domain.UsersVO;


public interface CartMapper {
	public List<CartListVO> selectCart(String usersId);
	public int insertCart(CartVO cart);
	public int countCart(CartVO cart);
	public int updateCart(CartVO cart);
	public int updateQuantity(CartVO cart);
	public int deleteCart(int cartNo);
	
	public UsersVO getUsersNamePhoneEmail(String usersId);
	
	public int getOrdererNo();
	public int insertOrderInfo(OrdererInfoTBLVO oi_vo);
	public int insertOrderList(OrderListTBLVO ol_vo);
	
}
