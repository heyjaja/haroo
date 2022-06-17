package com.haroo.mypage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MyPageUserDTO {

    private int em_no;// 사원 번호
    private String em_phone;// 휴대 전화
    private String em_email;// 이메일
    private String em_pw;// 비밀번호

}
