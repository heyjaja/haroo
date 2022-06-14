package com.haroo.dayoff.service;

import java.util.List;

import com.haroo.dayoff.domain.DayoffUsageVO;
import com.haroo.dayoff.domain.DayoffVO;

public interface DayoffService {
	public DayoffVO statusDayoff(int emNo); //휴가현황 (휴가 일수)
	
//	public List<DayoffUsageVO> printUsageList(int emNo); //사용내역
	public List<DayoffUsageVO> printUsageList(DayoffUsageVO vo); //사용내역
	
	
	public String printToday(); //오늘 기준 연도 출력
}
