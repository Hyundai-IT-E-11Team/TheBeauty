package com.kosa.theBeauty.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.dao.ProductDAO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
	
	private final ProductDAO dao;
	
	// 상품 상세 정보 조회
	public ProductDetailVO getProductDetail(int product_seq) {

		return dao.getProductDetails(product_seq);
	}
	
	// 브랜드별 상품 목록 조회 (브랜드관 페이지)
	public List<ProductDetailVO> getProductsByBrand(int brandSeq) {
		
		return dao.getProductsByBrand(brandSeq);
	}
	
}
