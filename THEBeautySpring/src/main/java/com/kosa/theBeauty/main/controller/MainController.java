package com.kosa.theBeauty.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.domain.BrandVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("main")
@RequiredArgsConstructor
public class MainController {
	
	@DebugLog
	@GetMapping("mainPage")
	public String login() {
		return "main/userMain";
	}
	
	@DebugLog
	@PostMapping("brandPage")
	public String brandPage(BrandVO vo, Model model) {
		model.addAttribute("brand", vo);
		return "main/brand";
	}
}
