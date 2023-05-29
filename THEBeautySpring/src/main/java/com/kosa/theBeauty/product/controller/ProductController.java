package com.kosa.theBeauty.product.controller;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.theBeauty.annotation.DebugLog;
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
}
