package com.kosa.theBeauty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	UserService service;
	
	@DebugLog
	@PostMapping("login")
	public String login(UserDTO dto) {
		service.login(dto);
		return null;
	}
}
