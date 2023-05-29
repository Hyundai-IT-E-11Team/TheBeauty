package com.kosa.theBeauty.product.service;

import org.springframework.stereotype.Service;
import com.kosa.theBeauty.product.dao.ProductDAO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
	
	private final ProductDAO dao;
	
	public ProductDetailVO getProductDetail(int product_seq) {

		return dao.getProductDetails(product_seq);
	}
	
}
