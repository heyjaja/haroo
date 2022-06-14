package com.haroo.dayoff.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.attendance.mapper.AttendanceMapper;
import com.haroo.attendance.service.AttendanceServiceImpl;
import com.haroo.dayoff.domain.DayoffUsageVO;
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
	public DayoffVO statusDayoff(int emNo) { //휴가현황(일수)
		DayoffVO dayoff = new DayoffVO();
		
		//사용일수가 총 휴가일수를 넘지 않으면 값 넣기
		if(dayoff.getDaCnt() <= dayoff.getDaTotal()) {
			dayoff.setDaCnt(mapper.updateUse(emNo));
		}
		
		dayoff.setDaRemainder(dayoff.getDaTotal() - dayoff.getDaCnt());
		dayoff = mapper.statusDayoff(emNo);
		
		log.info("status dayoff.............." + dayoff);
		
		return dayoff;
	}

	@Override
	public List<DayoffUsageVO> printUsageList(int emNo) {
		log.info("print usage list.............." + emNo);
		return mapper.printUsageList(emNo);
	}

	@Override
	public String printToday() {
		log.info("날짜 출력..............");
		return mapper.printToday();
	}

	
}
