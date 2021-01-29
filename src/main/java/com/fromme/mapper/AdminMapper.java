package com.fromme.mapper;

import java.util.List;

import com.fromme.domain.ChartVO;
import com.fromme.domain.IndexViewVO;
import com.fromme.domain.UserListVO;

public interface AdminMapper {
	
	//최근 4개의 신규 클래스를 가져온다 
//	public ClassesVO getIndexClasses();
	
	//최근 한달간의 조회 수를 가져온다 .
	public IndexViewVO getIndexView();
	
	//금일 접속자 중 동일 아이피가 존재하는지 확인
	public int getSameIp(String user_ip);
	
	//조회 수 업데이트 쿼리 
	public int insertView(String user_ip);
	
	//최적화 필요  
	//일주일 간의 클래스 예약 횟수를 구하는 쿼리 
	public List<ChartVO> getClassChartWeekData(String classify, String classify_dateFormat, String startTime, String endTime);
	//최적화 필요 
	//일주일을 제외한 나머지 클래스 예약 횟수 
	public List<ChartVO> getClassChartData(String classify, String dateFormat, String startTime, String endTime); 
	
	//한달동안의 클래스 예약 데이터를 가져온다. 
	public int getIndexReserve(String startTime, String endTime);
	
	//공방 승인 페이지 쿼리 
	public int getStudioApplyCount();
	//최적화 가능할듯? 
	//공방 승인 페이지 페이징 처리 
	//public List<StudioVO> getStudioApplyList(int startRow, int endRow);
	
	//공방 승인 완료 쿼리 
	public int setStudioAuthority(int authority, int studio_no);
	//cwg
	//유저 목록 가져오는 쿼리
	public List<UserListVO> getUserList(int startRow, int endRow);
	
	//게시글 비활성화 쿼리
	public int setPrivate(int post_pub, int post_no);
	
	//유저 숫자 가져오는 쿼리 
	public int getUserCnt();
	
	//유저 상태 변경 쿼리 
	public int setUserState(int users_authority, int users_no);
	
	//클래스 상태 변경 쿼리 
	public int setClassState(int classes_state, int classes_no);
	
	//유저 정보 변경하는 쿼리 
	public int setUserInfo(String user_name, String user_email, String user_phone, int user_authority);
	
	//유저 비밀번호 초기화하는 쿼리 
	public int resetPassword(String user_id);
	
	
}
