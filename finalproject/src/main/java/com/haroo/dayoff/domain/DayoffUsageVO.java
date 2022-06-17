package com.haroo.dayoff.domain;

import lombok.Data;

@Data
public class DayoffUsageVO {
	private int emNo; // 사번
	private String leTitle; // 제목
	private String apContent; // 내용
	private int leKind; // 휴가종류
	private String leStart; // 시작일
	private String leEnd; // 종료일
	public int leDays; // 휴가 사용일수
	
	private String searchYear; // 검색연도

}
