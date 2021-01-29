package com.fromme.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fromme.domain.ChartVO;
import com.fromme.domain.IndexViewVO;
import com.fromme.domain.UserListVO;
import com.fromme.domain.UserVO;
import com.fromme.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public int getIndexReserve() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getIndexTotalReserve() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String getWeekChartIndexData(String chart, String classify) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String getChartData(String chart, String date) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String getChartDataIndexData(String chart, String classify) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String getWeekChartData(String chart, String date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertView(HttpServletRequest request) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getSameIp(String ip) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public IndexViewVO getIndexView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setStudioAuthority(int authority, int studio_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getStudioApplyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setPrivate(int post_no, int pub) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUserState(int users_no, int users_authority) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setClassState(int classes_no, int classes_state) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserListVO> getUserList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setUserInfo(UserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int resetPassword(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getUserCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

}
