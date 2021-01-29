package com.fromme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fromme.domain.Criteria;
import com.fromme.domain.PageDTO;
import com.fromme.domain.StudioVO;
import com.fromme.service.MapService;

import lombok.Setter;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@Setter(onMethod_ = @Autowired)
	private MapService service;
	
	@GetMapping("/search")
	public void search(@ModelAttribute("search") String search, Model model) {
	}
	
	@GetMapping("/search/{search}/{page}")
	@ResponseBody
	public ResponseEntity<JSONObject> searchList(@PathVariable("search") String search, @PathVariable("page") int page, HttpSession session) {
		String session_id = session.getId();
		JSONObject users_address = new JSONObject();
		JSONObject pages = new JSONObject();
		if(session_id == null) {
			users_address.put("name", "출발지를 입력해주세요.");
			users_address.put("address", "");
		}else {
			String address = service.getUserAddress(session_id);
			users_address.put("name", "회원님의 주소");
			users_address.put("address",  address);
		}
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		cri.setAmount(8);
		PageDTO pageInfo = new PageDTO(cri, service.getFindGongBangListCount(search));
		
		List<StudioVO> gongbangLists = service.getFindGongBangList(search, cri);
		System.out.println("gongbangLists : ");
		gongbangLists.forEach(System.out::println);
		pages.put("nowPage", cri.getPageNum());
		pages.put("totalPage", pageInfo.getRealEnd());
		
		JSONArray arr = new JSONArray();
		
        for(int i=0;i<gongbangLists.size();i++) {
        	JSONObject gongbangInfo = new JSONObject();
        	gongbangInfo.put("name", gongbangLists.get(i).getStudioName());
        	gongbangInfo.put("address", gongbangLists.get(i).getStudioAddress());
        	arr.add(gongbangInfo);
        }
        JSONObject list = new JSONObject();
        list.put("page", pages);
        list.put("user", users_address);
        list.put("gongbang", arr);
		
        return new ResponseEntity<JSONObject>(list, HttpStatus.OK);
		
	}
}
