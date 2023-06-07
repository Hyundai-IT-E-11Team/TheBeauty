package com.kosa.theBeauty.product.service;

import java.util.List;

import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

public interface ProductService {

	List<ProductVO> selectProductListByKeywordPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByBrandSeq(int brandSeq);
	List<ProductDetailVO> selectProductListByBrandPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByCategoryPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByBrandSeqAndQuery(int brandSeq, String query);
	ProductDetailVO selectProductDetailByProductSeq(int product_seq);
	PaginationVO calculateAndSetOffset(PaginationVO paginationVO);
	int selectProductCountByKeywordPagination(PaginationVO paginationVO);
	int selectProductCountByBrandPagination(PaginationVO paginationVO);
	int selectProductCountByCategoryPagination(PaginationVO paginationVO);
	int calculatePaginationNum(int totalNum);
}
