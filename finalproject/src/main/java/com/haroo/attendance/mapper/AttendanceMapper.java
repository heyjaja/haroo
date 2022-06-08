package com.haroo.attendance.mapper;

import java.util.List;

import com.haroo.attendance.domain.AttendanceVO;

public interface AttendanceMapper {
	int insertStartTime(int emNo); //출근 입력 (현재날짜, 사번, 출근시간)
	int updateEndTime(int emNo); //퇴근시간 업데이트
	int insertOutside(int emNo); //외근 입력 (현재날짜, 사번, 출/퇴근시간, 근무상태:3)
	int updateState(int emNo); //근무상태 업데이트 (정상/지각)
	
	int insertDayoff(); //휴가인 사람 입력 (현재날짜, 사번, , 근무상태:4, 비고 업뎃)
	
	List<AttendanceVO> statusAttendance(int emNo); //일별 근태조회
	List<AttendanceVO> listDept(int emNo); //로그인한 사람의 부서목록
	String printToday(); //오늘날짜
	
}
