package com.fromme.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.fromme.domain.IndexViewVO;
import com.fromme.domain.UserListVO;
import com.fromme.domain.UserVO;

public interface AdminService {
	//메인 페이지 총 예약 수, 한달 간 수익 구하는 쿼리
	public int getIndexReserve();
	
	public int getIndexTotalReserve();
	
	//차트 데이터 분기 처리
	public String getChartDataIndexData(String chart, String classify);
	public String getChartData(String chart, String date);
	
	//일주일 차트 데이터 
	public String getWeekChartIndexData(String chart, String classify);
	public String getWeekChartData(String chart, String date);
	
	//페이지 조회 시 인서트
	public void insertView(HttpServletRequest request);
	
	//오늘 접속한 아이피 가져오기
	public int getSameIp(String ip);
	
	//메인페이지 조회 수 데이터 가져오기
	public IndexViewVO getIndexView();
	
	//공방 기각 및 승인
	public int setStudioAuthority(int authority, int studio_no);
	
	//승인 목록 가져오기
	//public List<StudioVO> getStudioApplyList(int startRow, int endRow)
	
	//승인 목록 갯수 가져오기
	public int getStudioApplyCount();
	
	//게시글 비공개 설정
	public int setPrivate(int post_no, int pub);
	
	//유저 상태 변경
	public int setUserState(int users_no, int users_authority);
	
	//클래스 상태 변경
	public int setClassState(int classes_no, int classes_state);
	
	//클래스 목록 가져오기
	//public List<ClassesVO> getClassList(int startRow, int endRow)
	
	//유저 목록 가져오기
	public List<UserListVO> getUserList(int startRow, int endRow);
	
	//유저 수정 
	public int setUserInfo(UserVO user);
	
	//패스워드 리셋
	public int resetPassword(String id);
	
	//유저 수 
	public int getUserCnt();

	
}
