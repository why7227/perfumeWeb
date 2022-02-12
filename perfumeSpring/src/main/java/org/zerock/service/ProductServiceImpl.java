package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ProductDTO;
import org.zerock.mapper.ProductMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper mapper;

	@Override
	public List<ProductDTO> PList() {

		return mapper.selectList();
	}

	@Override
	public List<ProductDTO> PLists(String var) {
	
		int categoryNum= -1;
	    switch(var) {
	    case "man" :
	    	categoryNum=1;
	    	break;
	    
	    case "woman" :
	    	categoryNum=2;
	    	break;
	    	
	    case"defuser":
	    	categoryNum=3;
	    	break;
	    	
	    case"candle":
	    	categoryNum=4;
	    	break;
	    }
	return mapper.selectLists(categoryNum);
}

	@Override
	public ProductDTO PListsDetail(String pcode) {
	
	return mapper.selectListsDetail(pcode);
}

	@Override
	public List<List<ProductDTO>> newList() {
	
	List<List<ProductDTO>> result = new ArrayList<List<ProductDTO>>();
	for(int i = 1; i < 5; i++) {
		result.add(mapper.newList(i));
	}
	return result;
	}
}
