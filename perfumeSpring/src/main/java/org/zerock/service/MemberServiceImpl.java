package org.zerock.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberDTO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Override 
	public int Check(String userid, String pwd) {
		
		int result = -1;
		String check = mapper.userCheck(userid);
		
		if(pwd.equals(check)) {
			result = 1;
		} else if(check != null && !check.equals(pwd)) {
			result = 0;
		}
		return result;
	}
	 
	@Override
	public void register(MemberDTO mDto) {
		
		mapper.insertMember(mDto);
	}

	@Override
	public void update(MemberDTO mDto) {
		
		mapper.updateMember(mDto);
	}

	@Override
	public MemberDTO read(String userid) {
		
		return mapper.readMember(userid);
	}
	
	@Override
	public int idChk(String userid) {
		
		int result = mapper.confirmID(userid);
		return result;
	}
	
	@Override
	public String Find(String name, String phone) {
		
		String result = mapper.idFind(name, phone);
		return result;
	}	
}


