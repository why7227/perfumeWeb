package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CartDTO;
import org.zerock.mapper.CartMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	CartMapper mapper;
	
	@Override
	public void insert(CartDTO cDto) {
		mapper.insert(cDto);
	}

	@Override
	public List<CartDTO> listCart(String mcode) {
		// TODO Auto-generated method stub
		return null;
	}

}
