package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/")
public class IndexController {
	
	ProductService service;
	
	
	@RequestMapping("/*")
	public String newList(Model model, HttpServletRequest request) {
		
		request.getSession();
		model.addAttribute("nProduct", service.newList());
		
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		logger.debug("home-----------------------------");
//		return "redirect:./index";
//	}
	
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public void index() {
//		logger.debug("index-----------------------------");
//	}
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public void index() {
//		logger.debug("index-----------------------------");
//	}
//	
//	@RequestMapping("/")
//	public String newList(Model model, int category) {
//		
//		model.addAttribute("nProduct", service.newList(category));
//		return "index";
//	}
}
