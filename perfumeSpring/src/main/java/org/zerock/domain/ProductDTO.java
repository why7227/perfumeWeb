package org.zerock.domain;

import lombok.Data;

@Data
public class ProductDTO {
	private String pcode; // 상품번호
	private String pname; // 상품이름
	private int price;    // 가격
	private int stock;    // 재고
	private int category;// 카테고리(남자향수,여자향수,디퓨져,캔들)
	private String purl; // 이미지주소
	private String des1; // 상세이미지1
	private String des2; // 상세이미지2
	private String des3; // 상세이미지3
}
