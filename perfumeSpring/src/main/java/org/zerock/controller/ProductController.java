package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.ProductDTO;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
@RequestMapping("/goods/*")
public class ProductController {
	
	@Autowired
	ProductService service;

	// 테스트(남자향수불러오기)
	@RequestMapping("/list")
	public String PList(Model model) {
		
		List<ProductDTO> list = service.PList();
		model.addAttribute("products", list);

		return "/goods/product";
	}

	// 카테고리(1:남자향수,2:여자향수,3:디퓨져,4:캔들)
	@RequestMapping("/{varname}")
	public String PLists(@PathVariable String varname, Model model) {

		String cateName = null;

		if (varname.equals("man")) {
			cateName = "Man perfume";
		} else if (varname.equals("woman")) {
			cateName = "Woman perfume";
		} else if (varname.equals("defuser")) {
			cateName = "Defuser";
		} else if (varname.equals("candle")) {
			cateName = "Candle";
		}

		model.addAttribute("cateName", cateName);
		model.addAttribute("products", service.PLists(varname));
		return "/goods/product";
	}

	// 상세페이지
	@RequestMapping("/detail")
	public String PListsDetail(String pcode, Model model) {
		
		model.addAttribute("product", service.PListsDetail(pcode));
		return "/goods/product_detail";
	}
}
