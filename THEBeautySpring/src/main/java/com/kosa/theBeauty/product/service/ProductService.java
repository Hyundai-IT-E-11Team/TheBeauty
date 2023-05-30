package com.kosa.theBeauty.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.dao.ProductDAO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

	// 상품 리스트 페이지 - pjw
	private final ProductDAO dao;

	public List<ProductVO> search(ProductVO vo) {

		return dao.selectProductByKeyword(vo);
	}
	
	// 상품 상세페이지 - phw
	public ProductDetailVO getProductDetail(int product_seq) {

		return dao.getProductDetails(product_seq);
	}
	
	// 브랜드관 페이지  - kww
	public List<ProductVO> getListByBrandName(String brandName) {
		return dao.selectProductByBrandName(brandName);
	}
	
	// 브랜드별 상품 목록 조회 (브랜드관 페이지) - phw
	public List<ProductDetailVO> getProductsByBrand(int brandSeq) {
		
		return dao.getProductsByBrand(brandSeq);
	}

	// header에서 카테고리 별로 상품 검색 - phw
	public List<ProductVO> getProductByCategory(String productCategory) {

		return dao.selectProductByCategory(productCategory);
	}
}
