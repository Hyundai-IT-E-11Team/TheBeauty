package com.kosa.theBeauty.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;

import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.domain.ProductVO;
import com.kosa.theBeauty.product.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("product")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productService;

	@DebugLog
	@GetMapping("search")
	public String searchProduct(PaginationVO paginationVO, Model model) {
	
		int totalNum = productService.selectProductCountByKeywordPagination(paginationVO);
		List<ProductVO> products = productService.selectProductListByKeywordPagination(paginationVO);
		int paginationNum = productService.calculatePaginationNum(totalNum);
		
		model.addAttribute("totalNum", totalNum);
		model.addAttribute("products", products);
		model.addAttribute("paginationNum", paginationNum);
		model.addAttribute("productName", paginationVO.getProductName());
		model.addAttribute("page", paginationVO.getPage());

		return "product/productSearchResult";
	}
	
	@DebugLog
	@GetMapping("detailPage/{product_seq}")
	public String getProductDetails(@PathVariable ("product_seq") int productSeq, Model model) {

		if (productSeq == 0) {
			return "product/productSearchResult";
		} else {
			ProductDetailVO productDetail = productService.selectProductDetailByProductSeq(productSeq);
			model.addAttribute("productDetail", productDetail);
			return "product/productDetail";
		}
	}
	
	@DebugLog
	@GetMapping("list/{brandSeq}")
	public ResponseEntity<List<ProductVO>> list(@PathVariable int brandSeq) {
		
		return new ResponseEntity<>(productService.selectProductListByBrandSeq(brandSeq), HttpStatus.OK);
	}
	
	@DebugLog
	@GetMapping("category/{productCategory}")
	public String getCategoryProductPaged(@PathVariable("productCategory") String productCategory, PaginationVO paginationVO, Model model) {
		
		paginationVO.setProductCategory(productCategory);
		int totalNum = productService.selectProductCountByCategoryPagination(paginationVO);
		List<ProductVO> products = productService.selectProductListByCategoryPagination(paginationVO);
		int paginationNum = productService.calculatePaginationNum(totalNum);
		
		model.addAttribute("totalNum", totalNum);
		model.addAttribute("products", products);
		model.addAttribute("paginationNum", paginationNum);
		model.addAttribute("productCategory", productCategory);
		model.addAttribute("page", paginationVO.getPage());
		
		return "product/categoryProduct";
	}
	
	@DebugLog
	@GetMapping("list/{brandSeq}/{query}")
	public ResponseEntity<List<ProductVO>> search(@PathVariable int brandSeq, @PathVariable String query) {
		
		return new ResponseEntity<List<ProductVO>> (productService.selectProductListByBrandSeqAndQuery(brandSeq, query), HttpStatus.OK);
	}
}
