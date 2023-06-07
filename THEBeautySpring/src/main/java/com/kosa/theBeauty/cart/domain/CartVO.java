package com.kosa.theBeauty.cart.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	private int userSeq;
	private int productSeq;
	private int productCount;
}
