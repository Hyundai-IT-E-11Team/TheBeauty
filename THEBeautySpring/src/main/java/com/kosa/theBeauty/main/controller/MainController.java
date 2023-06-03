package com.kosa.theBeauty.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.product.domain.ProductDetailVO;
import com.kosa.theBeauty.product.service.ProductService;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("main")
@RequiredArgsConstructor
public class MainController {
	
	// 스프링 의존성 주입에 의해 다른 패키지에있는 ProductService 클래스를 사용 가능
    private final ProductService service;
	private final reserveService reService;
    
	@DebugLog
	@GetMapping("mainPage")
	public String login(@SessionAttribute(required = false) UserVO currUser, Model model) {
		if(currUser != null && currUser.getRoleNum() == 0) {
			model.addAttribute("nextReservation", reService.getReservation(currUser.getUserSeq()));
		}
		return "main/userMain";
	}
	
	@DebugLog
	@PostMapping("brandPage")
	public String brandPage(BrandVO vo, Model model) {
		List<ProductDetailVO> products = service.getProductsByBrand(vo.getBrandSeq());
		model.addAttribute("brand", vo);
		model.addAttribute("products", products);
		return "main/brand";
	}
}
