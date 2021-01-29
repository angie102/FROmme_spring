package com.fromme.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fromme.domain.Criteria;
import com.fromme.domain.PageDTO;
import com.fromme.domain.PostVO;
import com.fromme.service.BoardService;
import com.fromme.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService r_service;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, HttpSession session, Model model){
		log.info("list...");
		
		String session_id = session.getAttribute("session_id") != null ? (String)session.getAttribute("session_id") : "";
		
		cri.setUsers_authority(service.getAuthority(session_id));
		cri.setCategory_name(service.getBoardCategoryName(cri.getCategory_no()));
		log.info(cri);
		if(cri.getList_type().equals("image")) {
			cri.setAmount(8);
			model.addAttribute("list", service.getBoardImageList(cri));
		}else {
			model.addAttribute("list", service.listAll(cri));
		}
		model.addAttribute("pageMaker", new PageDTO(cri, service.boardListCount(cri)));
	}
	
	@GetMapping("/write")
	public void write(@ModelAttribute("cri") Criteria cri) {}
	
	@PostMapping("/write")
	public String write(PostVO post, @RequestParam("file") MultipartFile[] uploadFiles, Criteria cri, RedirectAttributes rttr) throws IOException{
		service.insertBoard(post, uploadFiles);
		
		rttr.addFlashAttribute("result", post.getPost_no());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping({"/modify", "/view"})
	public void get(@RequestParam("post_no") int post_no, @ModelAttribute("cri") Criteria cri, @RequestParam(value="users_id", required=false) String users_id, Model model, HttpServletRequest request) {
		log.info("Criteria : " + cri);
		log.info("post_no : " + post_no);
		
		model.addAttribute("board", service.getDetail(post_no));
		model.addAttribute("files", service.getFiles(post_no));
		model.addAttribute("users_id", users_id);
		model.addAttribute("nextBoard", service.getNextBoard(cri, post_no, users_id));
		model.addAttribute("prevBoard", service.getPrevBoard(cri, post_no, users_id));		
	}
	
	@PostMapping("/modify")
	public String modify(PostVO post, @RequestParam("file") MultipartFile[] uploadFiles, Criteria cri, RedirectAttributes rttr) throws IOException {
		log.info("modify...");
		log.info("postVO : " + post);
		int result = service.updateBoard(post, uploadFiles);
		
		rttr.addFlashAttribute("result", result == 1 ? "success" : "fail");
		
		String url = "redirect:/board/view" + cri.getListLink() + "&post_no=" + post.getPost_no();
		
		if(cri.getField().equals("board") || cri.getField().equals("reply"))
			url += "&users_id=" + post.getUsers_id();
		
		return url;
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("post_no") int post_no, Criteria cri, @RequestParam(value="users_id", required=false) String users_id, RedirectAttributes rttr) {
		log.info("delete...");
		
		int result = service.deleteBoard(post_no);
		
		rttr.addFlashAttribute("result", result == 1 ? "success" : "fail");
		
		if(cri.getField().equals("board") || cri.getField().equals("reply"))
			return "redirect:/board/listByUser" + cri.getListLink() + "&users_id=" + users_id;
		else 
			return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping("/listByUser")
	public void listByUser(@ModelAttribute("users_id") String users_id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("users_id : " + users_id);
		log.info("cri : " + cri);
		int totalBoardCount = service.getBoardListCountByUser(cri, users_id);
		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("totalReplyCount", service.getReplyCountByUser(users_id));
		model.addAttribute("list", service.getBoardListByUser(cri, users_id));
		model.addAttribute("pageMaker", new PageDTO(cri, totalBoardCount));
	}
}
