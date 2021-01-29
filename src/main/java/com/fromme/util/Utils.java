package com.fromme.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Calendar;
import java.util.Enumeration;

public class Utils {
	
	//파라미터로 받은 변수가 10보다 작은 경우 앞에 0을 붙여 리턴해준다!
	public String isLtTen(int number) {
		String result = "";
		if(number < 10 && number > -1) {
			return result = "0"+number;
		} else {
			result = number+"";
		}
		return result;
	}
	
	//오늘 날짜를 구하는 메서드
	//yyyy-mm-dd
	public String getToday() {
		String [] time = new String[3];
		Calendar cal = Calendar.getInstance();
		time[0] = cal.get(Calendar.YEAR)+"";
		time[1] = cal.get(Calendar.MONTH)+1+"";
		time[2] = cal.get(Calendar.DATE)+"";
		return time[0]+"-"+time[1]+"-"+time[2];
		
	}
	
	//파라미터로 넘겨준 월의 마지막 날을 구하는 메서드
	public int getLastDay(String date) {
		String [] dateData = date.split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(dateData[0]), Integer.parseInt(dateData[1]), Integer.parseInt(dateData[2]));
		return cal.getActualMaximum(Calendar.DAY_OF_MONTH)-1;
		
	}
	
	//서버에서 사용자 ip 확인
	public String getUserIpInLinux() {
		try {
			String ip = null;

			boolean isLoopBack = true;
			Enumeration<NetworkInterface> en;  
			en = NetworkInterface.getNetworkInterfaces();


			while(en.hasMoreElements()) {
				NetworkInterface ni = en.nextElement();
				if (ni.isLoopback())
					continue;

				Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
				while(inetAddresses.hasMoreElements()) { 
					InetAddress ia = inetAddresses.nextElement();
					if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
						ip = ia.getHostAddress();
						isLoopBack = false;
						break;
					}
				}
				if (!isLoopBack)
					break;
			}
			return ip;
		} catch (SocketException e) {
			e.printStackTrace();
			return "0:0:0:0:0:0:0:1";
		}
	}
}
