package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.CartDTO;
import org.zerock.domain.MemberDTO;
import org.zerock.service.CartService;


@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartService service;
	

	
	@RequestMapping("insert")
	public String insert(@ModelAttribute CartDTO cDto, HttpServletRequest request, int mcode) {
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("member");
		
		if(mDto == null) {
			return"/sign/login";
		}
		cDto.setMcode(mcode);
		service.insert(cDto);
		return "/goods/cart";
	}
}
