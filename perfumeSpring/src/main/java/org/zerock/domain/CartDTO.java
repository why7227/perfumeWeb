package org.zerock.domain;

import lombok.Data;

@Data
public class CartDTO {

	private int cart_code;
	private int mcode;
	private String pcode;
	private int amount;
	private String name;
	private String pname;
	private int price;
	
}
