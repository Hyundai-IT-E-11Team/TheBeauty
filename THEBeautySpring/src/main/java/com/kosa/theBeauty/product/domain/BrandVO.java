package com.kosa.theBeauty.product.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BrandVO {
	private int brandSeq;
	private String brandName;
	private String brandImgurl;
	private String brandImg1;
	private String brandImg2;
	private String brandImg3;
	private String brandImg4;
}