package com.kosa.theBeauty.product.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("product")
@RequiredArgsConstructor
public class ProductController {

	Logger log = LogManager.getLogger("case3");

	private final ProductService service;

	@DebugLog
	@GetMapping("detailPage/{product_seq}")
	public String getProductDetails(@PathVariable("product_seq") int product_seq, Model model) {
		log.debug("전달받은 product_seq는" + product_seq + "입니다");
		if (product_seq == 0) {
			return "product/productList";
		} else {
			ProductDetailVO productDetail = service.getProductDetail(product_seq);
			model.addAttribute("productDetail", productDetail);
			return "product/productDetail";
		}
	}
}
