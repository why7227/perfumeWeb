package org.zerock.mapper;


import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberDTO;

public interface MemberMapper {
	
public String userCheck(String userid);    // 사용자 인증
public void insertMember(MemberDTO mDto);  // 회원가입
public void updateMember(MemberDTO mDto);  // 회원수정
public MemberDTO readMember(String userid);// 회원정보
public int confirmID(String userid); 	   // 회원가입시 아이디 중복체크
public String idFind(@Param("name") String name, @Param("phone") String phone);  //아이디,비번찾기

}
