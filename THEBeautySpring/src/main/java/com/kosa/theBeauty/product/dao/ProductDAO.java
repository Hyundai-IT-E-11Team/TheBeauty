package com.kosa.theBeauty.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.product.domain.ProductDetailVO;

@Mapper
public interface ProductDAO {
	
	// 상품 상세 정보 조회
	ProductDetailVO getProductDetails(int product_seq);
	
	// 브랜드별 상품 목록 조회 (브랜드관 페이지)
	List<ProductDetailVO> getProductsByBrand(int brandSeq);
}
