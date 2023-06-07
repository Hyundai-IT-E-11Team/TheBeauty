package com.kosa.theBeauty.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.product.domain.PaginationVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.service.ProductService;
import com.kosa.theBeauty.reservation.service.ReserveService;
import com.kosa.theBeauty.reservation.service.ReserveServiceImpl;
import com.kosa.theBeauty.main.service.mainService;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.util.annotation.DebugLog;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("main")
@RequiredArgsConstructor
public class MainController {
	
	// 스프링 의존성 주입에 의해 다른 패키지에있는 ProductService 클래스를 사용 가능
    private final ProductService service;
	private final ReserveService reserveService;
	private final mainService mainService;
    
	@DebugLog
	@GetMapping("mainPage")
	public String login(@SessionAttribute(required = false) UserVO currUser, Model model) {
		if(currUser != null && currUser.getRoleNum() == 0) {
			model.addAttribute("nextReservation", reserveService.getReservation(currUser.getUserSeq()));
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
	@GetMapping("brand/{brandName}")
	public String getProductsByBrandPaged(@PathVariable("brandName") String brandName,  PaginationVO vo, Model model) {
		
		BrandVO brand =  mainService.getBrandInfoByBrandName(brandName);
		vo.setBrandName(brandName);
		vo.setBrandSeq(brand.getBrandSeq());
		
		int totalNum = service.getProductsCountByBrand(vo);
		
		List<ProductDetailVO> products = service.getProductsByBrandPaged(vo);
		
		int paginationNum = service.calculatePaginationNum(totalNum);
		
		model.addAttribute("brand", brand);

		model.addAttribute("totalNum", totalNum);

		model.addAttribute("products", products);
		
		model.addAttribute("paginationNum", paginationNum);
		
		model.addAttribute("brandName", brandName);
		
		model.addAttribute("page", vo.getPage());
		
		return "main/brand";
	}
}
