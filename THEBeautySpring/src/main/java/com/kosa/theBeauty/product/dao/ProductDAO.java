package com.kosa.theBeauty.product.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;

@Mapper
public interface ProductDAO {
	
	// 상품 상세 정보 조회
	ProductDetailVO getProductDetails(int product_seq);
}
