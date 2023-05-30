package com.kosa.theBeauty.product.controller;

import java.awt.print.Pageable;
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
	public String searchProduct(@RequestParam("productName") String keyword, ProductVO vo, Model model) {

		List<ProductVO> list = service.search(vo);

		// list를 JSP에 넘겨주기
		model.addAttribute("products", list);

		// 검색받은 keyword를 JSP에 넘겨주기
		model.addAttribute("keyword", keyword);

		return "product/productSearchResult";

	}
		
	@DebugLog
	@GetMapping("detailPage/{product_seq}")
	public String getProductDetails(@PathVariable("product_seq") int product_seq, Model model) {
		if (product_seq == 0) {
			return "product/productList";
		} else {
			ProductDetailVO productDetail = service.getProductDetail(product_seq);
			model.addAttribute("productDetail", productDetail);
			return "product/productDetail";
		}
	}
	
	@DebugLog
	@GetMapping("list/{brandName}")
	public ResponseEntity<List<ProductVO>> list(@PathVariable String brandName) {
		
		return new ResponseEntity<>(service.getListByBrandName(brandName), HttpStatus.OK);
	}
}
