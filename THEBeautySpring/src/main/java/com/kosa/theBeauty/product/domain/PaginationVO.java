package com.kosa.theBeauty.product.domain;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class PaginationVO {
	private String productName;
	private String productCategory;
	private String brandName;
	private int brandSeq;
	private int offset;
	private int page;
}
