package com.kosa.theBeauty.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.service.ProductService;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.main.service.mainService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("main")
@RequiredArgsConstructor
public class MainController {
	
	// 스프링 의존성 주입에 의해 다른 패키지에있는 ProductService 클래스를 사용 가능
    private final ProductService service;
	private final reserveService reService;
	private final mainService mainService;
    
	@DebugLog
	@GetMapping("mainPage")
	public String login(@SessionAttribute(required = false) UserVO currUser, Model model) {
		if(currUser != null && currUser.getRoleNum() == 0) {
			model.addAttribute("nextReservation", reService.getReservation(currUser.getUserSeq()));
			return "main/userMain";
		}
		else if(currUser != null && currUser.getRoleNum() != 0) {
			BrandVO adminBrandvo = mainService.getBrandInfo(currUser.getRoleNum());
			model.addAttribute("adminBrand",adminBrandvo);
			return "main/adminMain";
		}
		return "main/userMain";
	}
	
	@DebugLog
	@PostMapping("brandPage")
	public String getProductsByBrandPaged(int brandSeq, PaginationVO vo, BrandVO bvo, Model model) {
		int totalNum = service.getProductsCountByBrand(vo);
		List<ProductDetailVO> products = service.getProductsByBrandPaged(vo);
		int paginationNum = service.calculatePaginationNum(totalNum);
		
		model.addAttribute("totalNum", totalNum);

		model.addAttribute("products", products);
		
		model.addAttribute("paginationNum", paginationNum);
		
		model.addAttribute("productName", vo.getProductName());
		
		model.addAttribute("page", vo.getPage());
		

		model.addAttribute("brand", bvo);

		return "main/brand";
	}
}
