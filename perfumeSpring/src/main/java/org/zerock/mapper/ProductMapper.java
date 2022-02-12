package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ProductDTO;

public interface ProductMapper {
	
	public List<ProductDTO> newList(int category);     // 메인 신상품 
	public List<ProductDTO> selectList(); 			   // 테스트(남자향수불러오기)
	public List<ProductDTO> selectLists(int category); // 카테고리(1:남자향수,2:여자향수,3:디퓨져,4:캔들)
	public ProductDTO selectListsDetail(String pcode); // 상세페이지
	
}
