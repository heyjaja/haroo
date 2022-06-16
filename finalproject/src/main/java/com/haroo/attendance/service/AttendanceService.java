package com.haroo.attendance.service;

import java.util.List;

import com.haroo.attendance.domain.AttendanceVO;

public interface AttendanceService {
	public int insertStartTime(int emNo); //출근 입력 (현재날짜, 사번, 출근시간)
	public boolean updateEndTime(int emNo); //퇴근시간 업데이트
	public int insertOutside(int emNo); //외근 입력 (현재날짜, 사번, 출/퇴근시간, 근무상태:3)
	
	public int insertDayoff(); //휴가인 사람 입력 (현재날짜, 사번, , 근무상태:4, 비고 업뎃)
	
	public List<AttendanceVO> statusAttendance(int emNo); //당일 출근 목록
	public List<AttendanceVO> listDept(int emNo); //로그인한 사람의 부서목록
	public String printToday(); //오늘날짜
	
	public List<AttendanceVO> listDay(AttendanceVO attendance); //일별 부서 근태 목록 조회
	public List<AttendanceVO> listMonth(AttendanceVO attendance); //월별 개인 근태 목록 조회
	public String printSearchDate(String date); //검색 날짜
	
	public int countOnTime(AttendanceVO attendance); //정상출근 일수
	public int countLate(AttendanceVO attendance); //지각 일수
	public int getWorkingDay(String date); //근무일수 구하기
	public int countDayoffDay(AttendanceVO attendance); //월 사용 휴가 일수
}
