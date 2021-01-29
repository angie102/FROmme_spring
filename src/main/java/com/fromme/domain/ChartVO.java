package com.fromme.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChartVO{
	//기준일
	private String criteriaDate;
	private int dateData;
	
}
