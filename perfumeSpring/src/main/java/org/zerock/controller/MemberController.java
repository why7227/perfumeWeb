package org.zerock.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.MemberDTO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/login.do")
	public String loginPage(HttpServletRequest request,String userid) {
		
		String url = "/sign/login";
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		return url;
	}
	
	 @PostMapping("/login.do") 
	  public String Check(HttpServletRequest req, String userid, String pwd, Model model, MemberDTO mDto) {
		 
		 mDto = service.read(userid);

		 int result = service.Check(userid, pwd);
		 String message = null;
		 String url = "/sign/login";
		 
		 if(result == 0) {
			 message = "비밀번호가 맞지않습니다.";
		 } else if(result == -1) {
			 message = "일치하는정보없습니다.";
		 } else {
			HttpSession session = req.getSession();
			session.setAttribute("member", mDto);
			session.setAttribute("loginUser", result);
			url = "redirect:/";
		 }
		 model.addAttribute("message", message);
		 return url; 
	  }

	@GetMapping("/join.do")
	public String joinPage() {
		
		return "/sign/join";
	}
	
	@PostMapping("/join.do")
	public String register(MemberDTO mDto, HttpServletRequest request) {
		
		service.register(mDto);
		HttpSession session = request.getSession();
		session.setAttribute("userid", mDto.getUserid());
		
		return "/sign/login";
	}
	
	@GetMapping("/update")
	public String updatePage(MemberDTO mDto, String userid, HttpServletRequest request) {
			
		mDto = service.read(userid);
		HttpSession session = request.getSession();
		session.setAttribute("member",mDto);
			
		return "/sign/memberUpdate";
		}
		
	@PostMapping("/update") 
	public String update(MemberDTO mDto) {
			
		service.update(mDto);
		
		return "/sign/login";
		}

	@ResponseBody
	@GetMapping("/idCheck.do")
	public String confirmID(String userid) {
		
		int result = service.idChk(userid);
		log.info("결과값=" + result);
		if(result != 0) {
			return "fail"; // 중복 아이디 존재
		}
		else {
			return "success"; // 사용가능
		}
	}

	@RequestMapping("/idFind") 
	public String Find() {
		
		return "/sign/idFind";
	}
	
	@ResponseBody
	@RequestMapping("/idFind.do")
	public String Find(String name,String phone) {
		
		return service.Find(name,phone);
	  }
	  
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("member");
		
		if(mDto == null) {
			return"/sign/login";
		}
			return "/sign/mypage";
	}
	
	@GetMapping("/cart")
	public String cart(HttpServletRequest request) {
	HttpSession session = request.getSession();
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	
	if(mDto == null) {
		return"/sign/login";
	} else {
		return "/goods/cart";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 무효화
		
		return "redirect:/";
	}
}

