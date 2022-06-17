package com.haroo.login.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EmployeeVO {

	private int emNo;// 사원 번호
	private int poNo;// 직책 번호
	private int deNo;// 부서 번호
	private String emName;// 사원이름
	private String emExt;// 내선 전화
	private String emPhone;// 휴대 전화
	private String emEmail;// 이메일
	private String emFirst;// 입사일
	private String emLast;// 퇴사일
	private int auNo;// 권한 번호
	private String emPw;// 비밀번호

}
