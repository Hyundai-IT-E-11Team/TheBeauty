package com.kosa.theBeauty.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;

import com.kosa.theBeauty.user.service.UserService;

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
	
}
