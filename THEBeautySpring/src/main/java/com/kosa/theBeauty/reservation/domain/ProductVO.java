package com.kosa.theBeauty.reservation.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {

	private int productSeq;
	private int brandSeq;
	private String productName;
	private String productPrice;
	private String productImgurl;
	private String productCategory;
}
