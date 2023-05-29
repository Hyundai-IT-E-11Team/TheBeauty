package com.kosa.theBeauty.product.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.product.domain.ProductDetailVO;

@Mapper
public interface ProductDAO {
	
	ProductDetailVO getProductDetails(int product_seq);

}
