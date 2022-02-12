package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartDTO;

public interface CartMapper {
//	List<CartDTO> cartMoney();
	void insert(CartDTO cDto);	// 장바구니 추가
	List<CartDTO> listCart(String mcode); // 장바구니 목록
}
