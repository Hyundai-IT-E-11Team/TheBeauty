package com.kosa.theBeauty.cart.domain;


import com.kosa.theBeauty.product.domain.ProductVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CartListVO {
	private ProductVO productVO;
	private CartVO cartVO;
}
