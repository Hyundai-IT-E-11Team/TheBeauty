package com.kosa.theBeauty.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("register")
@RequiredArgsConstructor
public class UserController {

private final UserService service;
	
	@DebugLog
	
	@PostMapping
	public String post(UserVO userVO) {
		
		service.registerUser(userVO);
		
		return "user/login";
	}
}
