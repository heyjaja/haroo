package com.haroo.dayoff.mapper;

import java.util.List;

import com.haroo.dayoff.domain.DayoffUsageVO;
import com.haroo.dayoff.domain.DayoffVO;

public interface DayoffMapper {
	DayoffVO statusDayoff(int emNo); //휴가현황
	int updateUse (int emNo); //사용일수
	List<DayoffUsageVO> printUsageList(int emNo); //사용내역
	
	String printToday(); //오늘 출력
}
