package com.kosa.theBeauty.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.service.FindPwService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("find")
@RequiredArgsConstructor
public class FindPwController {
	
	private final FindPwService service;
	
	@DebugLog
	@GetMapping()
	public void findPwService(Model model) {
		// TODO Auto-generated method stub

	}
	
	
	
	
	
	

}
