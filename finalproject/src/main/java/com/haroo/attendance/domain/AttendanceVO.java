package com.haroo.attendance.domain;

import lombok.Data;

@Data
public class AttendanceVO {
	private String atDate;   //날짜
	private int emNo;		 //사번
	private String atStart;  //출근시간
	private String atEnd;    //퇴근시간
	private int atState;     //근무상태
	private int atNote;	    //비고
	private String emName;  //사원명
	private String deName;  //부서명
	
}
