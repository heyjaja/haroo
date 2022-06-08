package com.haroo.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.attendance.domain.AttendanceVO;
import com.haroo.attendance.mapper.AttendanceMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceMapper mapper;

	@Override
	public int insertStartTime(int emNo) { //출근 입력
		log.info("insert..............");
		return mapper.insertStartTime(emNo);
	}

	@Override
	public boolean updateEndTime(int emNo) { //퇴근 입력
		log.info("update end time............. " + emNo);
		return mapper.updateEndTime(emNo) == 1;
	}

	@Override
	public int insertOutside(int emNo) { //외근 입력
		log.info("insert outside..............");
		return mapper.insertOutside(emNo);
	}

//	@Override
//	public boolean updateState(int emNo) { //근무상태 수정
//		log.info("update work state............. " + emNo);
//		return mapper.updateState(emNo) == 1;
//	}

	@Override
	public int insertDayoff() { //휴가 입력
		log.info("insert dayoff..............");
		return mapper.insertDayoff();
	}

	@Override
	public List<AttendanceVO> statusAttendance(int emNo) { //출근 목록 출력
		
		AttendanceVO attendance = new AttendanceVO();
		attendance.setAtState(mapper.updateState(emNo));
		log.info("status Attendance.............." + attendance);
		return mapper.statusAttendance(emNo);
	}

	@Override
	public List<AttendanceVO> listDept(int emNo) { //로그인한 사원이 속한 부서원 목록 출력
		log.info("list Dept.............." + emNo);
		return mapper.listDept(emNo);
	}

	@Override
	public String printToday() { //오늘 날짜 출력
		log.info("print Today date..............");
		return mapper.printToday();
	}

}
