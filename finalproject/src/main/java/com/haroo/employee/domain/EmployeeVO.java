package com.haroo.employee.domain;

import lombok.Data;

@Data
public class EmployeeVO {

	private int em_no;// 사원 번호
	private int po_no;// 직책 번호
	private int de_no;// 부서 번호
	private String em_name;// 사원이름
	private String em_ext;// 내선 전화
	private String em_phone;// 휴대 전화
	private String em_email;// 이메일
	private String em_first;// 입사일
	private String em_last;// 퇴사일
	private int au_no;// 권한 번호
	private String em_pw;// 비밀번호


}
