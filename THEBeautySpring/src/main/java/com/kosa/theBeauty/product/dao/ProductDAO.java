package com.kosa.theBeauty.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

@Mapper
public interface ProductDAO {
	
	// pagination 검색 상품 개수 구하기 -pjw
	int selectProductCountByKeyword(PaginationVO vo);
	
	// 상품 키워드를 통해 검색 - pjw
	List<ProductVO> selectProductListByKeywordPaged(PaginationVO vo);
	
	// 상품 시퀀스를 통해 상품 상세정보 검색 - phw
	ProductDetailVO getProductDetails(int product_seq);
	
	// kww
	List<ProductVO> selectProductByBrandName(int brandSeq);
	 
	// 브랜드별 상품 목록 조회 (브랜드관 페이지) - phw
	int getProductsCountByBrand(PaginationVO vo);
	
	List<ProductDetailVO> getProductsByBrandPaged(PaginationVO vo);
	
	// header에서 카테고리 별로 상품 검색 - phw
	int selectProductCountByCategory(PaginationVO vo);
	
	List<ProductVO> selectProductByCategoryPaged(PaginationVO vo);

	List<ProductVO> selectProductByBrandAndQuery(@Param("brandSeq") int brandSeq,@Param("query") String query);
}
