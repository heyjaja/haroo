package com.haroo.attendance.mapper;

import java.util.List;

import com.haroo.attendance.domain.AttendanceVO;

public interface AttendanceMapper {
	int insertStartTime(int emNo); //출근 입력 (현재날짜, 사번, 출근시간)
	int updateEndTime(int emNo); //퇴근시간 업데이트
	int insertOutside(int emNo); //외근 입력 (현재날짜, 사번, 출/퇴근시간, 근무상태:3)
	int updateState(int emNo); //근무상태 업데이트 (정상/지각)
	
	int insertDayoff(); //휴가인 사람 입력 (현재날짜, 사번, , 근무상태:4, 비고 업뎃)
	
	List<AttendanceVO> statusAttendance(int emNo); //당일 출근 목록
	List<AttendanceVO> listDept(int emNo); //로그인한 사람의 부서목록
	String printToday(); //오늘날짜
	
	List<AttendanceVO> listDay(AttendanceVO attendance); //일별 부서 근태 목록 조회
	List<AttendanceVO> listMonth(AttendanceVO attendance); //월별 개인 근태 목록 조회
	String printSearchDate(String date); //검색 날짜
	
	int countOnTime(AttendanceVO attendance); //정상출근 일수
	int countLate(AttendanceVO attendance); //지각 일수
	int getWorkingDay(String date); //근무일수 구하기
	int getWorkingDayAsOfToday(String date); //오늘 기준 근무일수 구하기
	int countDayoffDay(AttendanceVO attendance); //월 사용 휴가 일수
}
