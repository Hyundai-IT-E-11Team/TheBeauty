package com.kosa.theBeauty.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	private final ProductService service;

	@DebugLog
	@GetMapping("search")
	public String searchProduct(PaginationVO vo, Model model) {
	
		
		// DB 가져와서 보내줘야 하는 것
		// 1. 검색한 상품의 개수
		int totalNum = service.selectProductCountByKeyword(vo);
		// 2. 페이지네이션된 상품 리스트 (20개씩 나오는 거)
		List<ProductVO> products = service.selectProductListByKeywordPaged(vo);
		
		// 그냥 보내줘야 하는 것
		// 3. 페이지네이션 개수
		int paginationNum = service.calculatePaginationNum(totalNum);
		// 4. PaginationVO (productName 키워드주는거)
			
		
		model.addAttribute("totalNum", totalNum);

		model.addAttribute("products", products);
		
		model.addAttribute("paginationNum", paginationNum);
		
		model.addAttribute("productName", vo.getProductName());
		
		model.addAttribute("page", vo.getPage());
		
		// list를 JSP에 넘겨주기


		return "product/productSearchResult";

	}
	
		
	@DebugLog
	@GetMapping("detailPage/{product_seq}")
	public String getProductDetails(@PathVariable ("product_seq") int productSeq, Model model) {

		if (productSeq == 0) {
			return "product/productSearchResult";
		} else {
			ProductDetailVO productDetail = service.getProductDetail(productSeq);
			model.addAttribute("productDetail", productDetail);
			return "product/productDetail";
		}
	}
	
	@DebugLog
	@GetMapping("list/{brandSeq}")
	public ResponseEntity<List<ProductVO>> list(@PathVariable int brandSeq) {
		
		return new ResponseEntity<>(service.getListByBrandName(brandSeq), HttpStatus.OK);
	}
	
	// header에서 카테고리 별로 상품 검색 - phw
	@DebugLog
	@GetMapping("category/{productCategory}")
	public String getCategoryProduct(@PathVariable("productCategory") String productCategory, Model model) {
		List<ProductVO> list = service.getProductByCategory(productCategory);
		// 리스트를 JSP에 넘겨주기
		model.addAttribute("products", list);
		model.addAttribute("productCategory", productCategory);
		
		return "product/categoryProduct";
	}
	
	//자기 브랜드 내의 상품 검색 - kww
	@DebugLog
	@GetMapping("list/{brandSeq}/{query}")
	public ResponseEntity<List<ProductVO>> search(@PathVariable int brandSeq, @PathVariable String query) {
		return new ResponseEntity<List<ProductVO>> (service.getListByBrandSeqAndQuery(brandSeq, query), HttpStatus.OK);
	}
}
