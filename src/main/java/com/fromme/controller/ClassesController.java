package com.fromme.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fromme.domain.CartListVO;
import com.fromme.domain.CartVO;
import com.fromme.domain.ClassesCriteria;
import com.fromme.domain.ClassesInfoVO;
import com.fromme.domain.ClassesPageDTO;
import com.fromme.domain.OrderListTBLVO;
import com.fromme.domain.OrdererInfoTBLVO;
import com.fromme.service.ClassesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/classes/*")
@Log4j
@AllArgsConstructor
public class ClassesController {
	private ClassesService service;
	
	@GetMapping("/list")
	public void list(ClassesCriteria cri, Model model) {
		log.info("list ClassesController............");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("genreMap", service.getGenreMap());
		model.addAttribute("studioMap", service.getStudioMap());
		model.addAttribute("likeMap", service.getLikeMap("test1"));
		model.addAttribute("pageMaker", new ClassesPageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping("/get")
	public void get(@ModelAttribute("classesNo") int classesNo, @ModelAttribute("cri")ClassesCriteria cri, @ModelAttribute("genName") String genreName, @ModelAttribute("stuName") String studioName,  Model model) {
		log.info("get ClassesController............");
		model.addAttribute("c_vo", service.getClassDetailMap(classesNo));
		model.addAttribute("availableDate", service.getAvailableDate(classesNo));
	}
	
	
	@GetMapping("/listCart")
	public void listCart( @ModelAttribute("usersId") String usersId, Model model) {
		log.info("listCart ClassesController............");
		model.addAttribute("list", service.getCartList(usersId));
	}

	@PostMapping("/payList")
	public String pay( @RequestParam("usersId") String usersId, @ModelAttribute("totalPrice") int totalPrice, Model model) {
		log.info("payList ClassesController............");
		model.addAttribute("list", service.getCartList(usersId));
		if(usersId!=null) model.addAttribute("usersVO",service.usersInfoForOrder(usersId));
		return "classes/pay";
	}
	
	@PostMapping("/payOne")
	public String payOne( @RequestParam("usersId") String usersId, @ModelAttribute("totalPrice") int totalPrice, CartListVO cart ,Model model) {
		log.info("payOne ClassesController............");
		if(usersId!=null) model.addAttribute("usersVO",service.usersInfoForOrder(usersId));
		model.addAttribute("isDirect","true");
		return "classes/pay";
	}
	
	
	@PostMapping("/orderListOk")
	public String payListOk( @RequestParam("usersId") String usersId, OrdererInfoTBLVO oi_vo, Model model) {
		log.info("orderListOk ClassesController............");
		OrderListTBLVO ol_vo =null;
		List<OrderListTBLVO> orderList  =new ArrayList<>();
		String path = "orderFail";
		
		List<CartListVO> list  = service.getCartList(usersId); //장바구니 가져오기
		
		if(service.insertOrdererInfo(oi_vo)) {
			int ordererInfoNo = service.getLastestOrdererNo(); //방금 추가한 주문자 번호 가져오기
			for (int i = 0; i < list.size(); i++) {
				ClassesInfoVO ci_vo = service.getClassesInfoByNo(list.get(i).getClassesInfoNo());

				//해당 클래스 신청가능 여부 확인
				if(ci_vo.checkAvailable(list.get(i).getCartQuantity())) {
					ol_vo = new OrderListTBLVO(usersId, ci_vo.getClassesInfoNo(), list.get(i).getCartQuantity(), ordererInfoNo, oi_vo.getPayType());
					service.insertOrderList(ol_vo); //주문저장
					service.updateClassesInfoStateAndNum(ci_vo);//클래스 상세정보 업데이트
					service.updateClassesStateAndNum(ci_vo.getClassesNo());//클래스 정보 업데이트
					service.removeCart(list.get(i).getCartNo());//주문한 장바구니 삭제
					orderList.add(ol_vo);
					path = "orderSuccess";
				}else {
					break;
				}
			}
		}
		return "redirect: /classes/"+ path;
	}
	
	@PostMapping("/orderOneOk")
	public String payOneOk( @RequestParam("usersId") String usersId, @RequestParam("classesNo") int classesNo, OrderListTBLVO ol_vo, OrdererInfoTBLVO oi_vo , CartListVO cart, Model model) {
		log.info("orderOneOk ClassesController............");
		String path = "orderFail";

		if(service.insertOrdererInfo(oi_vo)) {
			int ordererInfoNo = service.getLastestOrdererNo(); //방금 추가한 주문자 번호 가져오기
				ClassesInfoVO ci_vo = service.getClassesInfoByNo(ol_vo.getClassesInfoNo());
				//해당 클래스 신청가능 여부 확인
				if(ci_vo.checkAvailable(1)) {
					ol_vo = new OrderListTBLVO(usersId, ol_vo.getClassesInfoNo(), 1, ordererInfoNo, oi_vo.getPayType());
					service.insertOrderList(ol_vo); //주문저장
					service.updateClassesInfoStateAndNum(ci_vo);//클래스 상세정보 업데이트
					service.updateClassesStateAndNum(ci_vo.getClassesNo());//클래스 정보 업데이트
					
					path = "orderSuccess";
				}
		}
		return "redirect: /classes/"+ path;
	}
	@RequestMapping({"/orderSuccess","/orderFail"})
	public void orderResult() {
		
	}
	
}
