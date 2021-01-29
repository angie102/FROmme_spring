package com.fromme.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fromme.domain.FilesVO;
import com.fromme.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/file")
@Log4j
public class FileController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	private static String filePath = "C:\\Users\\soonho\\Desktop\\it\\SPRING\\workspace\\Fromme\\src\\main\\webapp\\resources\\files\\uploadFile";
	
	@GetMapping("/fileDownload")
	public void fileDownload(FilesVO file,  HttpServletResponse response) throws IOException {
		String originalFileName = file.getImage_path().substring(file.getImage_path().lastIndexOf("_") + 1);
		System.out.println("image_path : " + originalFileName);
		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath + "\\" + file.getImage_path())); 
		response.setContentType("application/octet-stream"); 
		response.setContentLength(fileByte.length); 
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";"); 
		response.setHeader("Content-Transfer-Encoding", "binary"); 
		response.getOutputStream().write(fileByte); 
		response.getOutputStream().flush(); 
		response.getOutputStream().close();
	}
	
	@PostMapping("/summernoteFileUpload")
	public ResponseEntity<String> summernoteFileUpload(@RequestParam("file") MultipartFile file) throws IOException {
		log.info("summernoteFileUpload....." + file);
		
		return new ResponseEntity<>(service.saveFile(file, 1), HttpStatus.OK);
		
	}
}
