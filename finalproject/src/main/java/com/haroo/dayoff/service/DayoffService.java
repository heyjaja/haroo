package com.haroo.dayoff.service;

import com.haroo.dayoff.domain.DayoffVO;

public interface DayoffService {
	public DayoffVO statusDayoff(int emNo); //휴가현황 전체 보기
//	public boolean updateUse (int emNo); //사용일수
//	public boolean updateRemainder (int emNo); //잔여일수
}
