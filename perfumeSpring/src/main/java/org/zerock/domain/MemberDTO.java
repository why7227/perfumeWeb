package org.zerock.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	
	private int mcode;       // 고객번호
	private String name;     // 이름
	private int gender;      // 성별
	private Date birth;	     // 생일
	private String userid;   // 아이디
	private String pwd;	     // 패스워드
	private String email;    // 이메일
	private String phone;    // 핸드폰번호
	private String postcode; //우편번호
	private String address;  // 주소
	private String addressDetail; // 상세주소
	private int admin;  // 관리자 or일반회원
	
}

