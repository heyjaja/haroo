package com.haroo.dayoff.mapper;

import com.haroo.dayoff.domain.DayoffVO;

public interface DayoffMapper {
	DayoffVO statusDayoff(int emNo); //휴가현황
	int updateUse (int emNo); //사용일수
	int updateRemainder (int emNo); //잔여일수
	

}
