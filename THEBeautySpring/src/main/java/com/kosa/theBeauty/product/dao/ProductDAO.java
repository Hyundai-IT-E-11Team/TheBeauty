package com.kosa.theBeauty.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

@Mapper
public interface ProductDAO {
	
	List<ProductVO> selectProductListByKeywordPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByBrandSeq(int brandSeq);
	List<ProductDetailVO> selectProductListByBrandPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByCategoryPagination(PaginationVO paginationVO);
	List<ProductVO> selectProductListByBrandSeqAndQuery(@Param("brandSeq") int brandSeq,@Param("query") String query);
	ProductDetailVO selectProductDetailByProductSeq(int product_seq);
	int selectProductCountByKeywordPagination(PaginationVO paginationVO);
	int selectProductCountByBrandPagination(PaginationVO paginationVO);
	int selectProductCountByCategoryPagination(PaginationVO paginationVO);
}
