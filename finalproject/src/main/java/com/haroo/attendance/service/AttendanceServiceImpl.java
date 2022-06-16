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

	@Override
	public List<AttendanceVO> listDay(AttendanceVO attendance) { //일별 부서 근태 목록 조회;
		log.info("Attendance List.............." + attendance);
		return mapper.listDay(attendance);
	}

	@Override
	public List<AttendanceVO> listMonth(AttendanceVO attendance) { //월별 개인 근태 목록 조회
		log.info("Attendance Month List .............." + attendance);
		return mapper.listMonth(attendance);
	}

	@Override
	public String printSearchDate(String date) { //검색 날짜
		log.info("print Search date..............");
		return mapper.printSearchDate(date);
	}

	@Override
	public int countOnTime(AttendanceVO attendance) { //정상출근 일수 카운트
		log.info("Count On Time days..............");
		return mapper.countOnTime(attendance);
	}

	@Override
	public int countLate(AttendanceVO attendance) { //지각 일수 카운트
		log.info("Count Late days..............");
		return mapper.countLate(attendance);
	}

	@Override
	public int getWorkingDay(String date) { //근무일수 구하기
		log.info("get Month Last Day..............");
		return mapper.getWorkingDay(date);
	}

	@Override
	public int countDayoffDay(AttendanceVO attendance) { //월 사용휴가 일수 카운트
		log.info("count dayoff Days..............");
		return mapper.countDayoffDay(attendance);
	}

}
