package com.koreait.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fromme.domain.CartVO;
import com.fromme.domain.ClassesCriteria;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.ClassesVO;
import com.fromme.domain.LikeitVO;
import com.fromme.domain.UsersVO;
import com.fromme.mapper.CartMapper;
import com.fromme.mapper.ClassesMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ClassesMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ClassesMapper classesMapper;
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;

	
	@Test
	public void selectCart() {
		log.info("selectCart: " + cartMapper.selectCart("test1"));
	}

	@Ignore
	@Test
	public void updateQuantity() {
		CartVO cart = new CartVO();
		cart.setCartNo(352);
		cart.setCartQuantity(10);
		log.info("updateQuantity: " + cartMapper.updateQuantity(cart));
	}
	
	@Ignore
	@Test
	public void removeCart() {
		log.info("removeCart: " + cartMapper.deleteCart(246));
	}

	@Ignore
	@Test
	public void getUsersNamePhoneEmail() {
		log.info("removeCart: " + cartMapper.getUsersNamePhoneEmail("test1"));
	}


	
}

















