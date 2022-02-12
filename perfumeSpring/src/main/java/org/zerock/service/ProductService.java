package org.zerock.service;

import java.util.List;

import org.zerock.domain.ProductDTO;

public interface ProductService {
	
	public List<List<ProductDTO>> newList();	   // 메인 신상품
	public List<ProductDTO> PList(); 			   // 테스트(남자향수불러오기)
	public List<ProductDTO> PLists(String var);    // 카테고리(1:남자향수,2:여자향수,3:디퓨져,4:캔들)
	public ProductDTO PListsDetail(String pcode);  // 상세페이지
	
}
	

