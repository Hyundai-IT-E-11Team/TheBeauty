package com.kosa.theBeauty.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

@Mapper
public interface ProductDAO {
	
	// 상품 키워드를 통해 검색 - pjw
	List<ProductVO> selectProductByKeyword(ProductVO vo);

	// 상품 시퀀스를 통해 상품 상세정보 검색 - phw
	ProductDetailVO getProductDetails(int product_seq);
	
	// 브랜드명을 통해 브랜드별 상품 리스트 검색 - phw
	List<ProductVO> selectProductByBrandName(String brandName);
	
	// 브랜드별 상품 목록 조회 (브랜드관 페이지)
	List<ProductDetailVO> getProductsByBrand(int brandSeq);
}
