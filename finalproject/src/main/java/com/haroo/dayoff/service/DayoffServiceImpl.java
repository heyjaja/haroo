package com.haroo.dayoff.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.attendance.mapper.AttendanceMapper;
import com.haroo.attendance.service.AttendanceServiceImpl;
import com.haroo.dayoff.domain.DayoffVO;
import com.haroo.dayoff.mapper.DayoffMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DayoffServiceImpl implements DayoffService {
	
	@Autowired
	private DayoffMapper mapper;

	@Override
	public DayoffVO statusDayoff(int emNo) { //휴가일수
		DayoffVO dayoff = new DayoffVO();
		
		dayoff.setDaCnt(mapper.updateUse(emNo));
		dayoff.setDaRemainder(mapper.updateRemainder(emNo));
		dayoff = mapper.statusDayoff(emNo);
		
		log.info("status dayoff.............." + dayoff);
		
		return dayoff;
	}

//	@Override
//	public boolean updateUse(int emNo) { //사용일수
//		log.info("update use dayoff......." + emNo);
//		return mapper.updateUse(emNo) == 1;
//	}
//
//	@Override
//	public boolean updateRemainder(int emNo) { //잔여일수
//		log.info("update remainder dayoff......." + emNo);
//		return mapper.updateRemainder(emNo) == 1;
//	}
	
}
