package com.kosa.theBeauty.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.product.domain.ProductVO;

@Mapper
public interface ProductDAO {
	
	// 상품 키워드를 통해 검색
	List<ProductVO> selectProductByKeyword(ProductVO vo);
}
