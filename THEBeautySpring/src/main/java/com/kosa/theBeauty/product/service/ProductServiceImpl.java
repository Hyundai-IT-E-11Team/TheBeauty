package com.kosa.theBeauty.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.dao.ProductDAO;
import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductDAO dao;

	public List<ProductVO> selectProductListByKeywordPagination(PaginationVO paginationVO) {
		
		paginationVO = calculateAndSetOffset(paginationVO);
		return dao.selectProductListByKeywordPagination(paginationVO);
	} 
	
	public List<ProductVO> selectProductListByBrandSeq(int brandSeq) {
		
		return dao.selectProductListByBrandSeq(brandSeq);
	}
	
	public List<ProductDetailVO> selectProductListByBrandPagination(PaginationVO paginationVO) {
		
		paginationVO = calculateAndSetOffset(paginationVO);
		return dao.selectProductListByBrandPagination(paginationVO);
	}
	
	public List<ProductVO> selectProductListByCategoryPagination(PaginationVO paginationVO) {
		
		paginationVO = calculateAndSetOffset(paginationVO);
		return dao.selectProductListByCategoryPagination(paginationVO);
	}
	
	public List<ProductVO> selectProductListByBrandSeqAndQuery(int brandSeq, String query) {
		
		return dao.selectProductListByBrandSeqAndQuery(brandSeq, query);
	}
	
	public ProductDetailVO selectProductDetailByProductSeq(int product_seq) {
		
		return dao.selectProductDetailByProductSeq(product_seq);
	}
	
	public PaginationVO calculateAndSetOffset(PaginationVO paginationVO) {
		
		if(paginationVO.getPage() == 0) {
			paginationVO.setPage(1);
		}
		int offset = 20 * (paginationVO.getPage() - 1);
		paginationVO.setOffset(offset);
		return paginationVO;
	}
	
	public int selectProductCountByKeywordPagination(PaginationVO paginationVO) {
		
		return dao.selectProductCountByKeywordPagination(paginationVO);
	}
	
	public int selectProductCountByBrandPagination(PaginationVO paginationVO) {
		
		return dao.selectProductCountByBrandPagination(paginationVO);
	}
	
	public int selectProductCountByCategoryPagination(PaginationVO paginationVO) {
		
		return dao.selectProductCountByCategoryPagination(paginationVO);
	}
	
	public int calculatePaginationNum(int totalNum) {
		
		return (int)Math.ceil((double)totalNum / 20);
	}
}
