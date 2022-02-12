package org.zerock.service;

import org.zerock.domain.MemberDTO;

public interface MemberService {
	
	public int Check(String userid, String pwd); // 사용자 인증
	public void register(MemberDTO mDto); 		 // 회원가입(등록)
	public void update(MemberDTO mDto);			 // 회원수정
	public MemberDTO read(String userid);		 // 회원정보
	public int idChk(String userid); 			 // 회원가입시 아이디 중복체크
	public String Find(String name, String phone); // 아이디,비번찾기
	
}
