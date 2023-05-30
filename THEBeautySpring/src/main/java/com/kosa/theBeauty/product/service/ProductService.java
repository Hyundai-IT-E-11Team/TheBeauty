package com.kosa.theBeauty.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.dao.ProductDAO;
import com.kosa.theBeauty.product.domain.ProductVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

	private final ProductDAO dao;

	public List<ProductVO> search(ProductVO vo) {

		return dao.selectProductByKeyword(vo);
	}
}
