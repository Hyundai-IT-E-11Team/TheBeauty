package com.kosa.theBeauty.product.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BrandVO {
	private int brandSeq;
	private String brandName;
	private String brandImgurl;
}