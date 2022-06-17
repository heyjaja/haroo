package com.haroo.dayoff.domain;

import lombok.Data;

@Data
public class DayoffVO {
	private int emNo; // 사번
	private String emName; // 사원 이름
	private int daTotal; //총 휴가일수
	private int daCnt; //사용일수
	private int daRemainder; //잔여일수
}
