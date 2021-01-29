package com.fromme.domain;

public class IndexViewVO {
	private int totalViews;
	private int dayViews;
	private int monthViews;
	
	public IndexViewVO() {;}
	
	
	public int getTotalViews() {
		return totalViews;
	}


	public void setTotalViews(int totalViews) {
		this.totalViews = totalViews;
	}


	public int getDayViews() {
		return dayViews;
	}
	public void setDayViews(int dayViews) {
		this.dayViews = dayViews;
	}
	public int getMonthViews() {
		return monthViews;
	}
	public void setMonthViews(int monthViews) {
		this.monthViews = monthViews;
	}
	
	
}
