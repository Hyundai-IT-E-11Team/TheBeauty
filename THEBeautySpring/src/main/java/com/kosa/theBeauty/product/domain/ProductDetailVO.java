package com.kosa.theBeauty.product.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
	
@Data
@NoArgsConstructor
public class ProductDetailVO {
	private ProductVO productVO;
	private BrandVO brandVO;
}

