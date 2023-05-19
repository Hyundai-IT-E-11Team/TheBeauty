package com.kosa.theBeauty.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.test.service.TestService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("test")
@RequiredArgsConstructor
public class TestController {
	
	private final TestService service;
	
	@DebugLog
	@GetMapping("get")
	public String get(Model model) {
		model.addAttribute("test", service.testService());
		return "test";
	}
	
}
