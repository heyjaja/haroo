package com.haroo.mypage.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MyPageUserDTO {

    private int emNo;// 사원 번호
    private String emPhone;// 휴대 전화
    private String emEmail;// 이메일
    private String emPw;// 비밀번호

}