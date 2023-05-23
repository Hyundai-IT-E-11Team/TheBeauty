package com.kosa.theBeauty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.user.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserController {

	private UserService service;
	
	@DebugLog
	@PostMapping(value="findEmail")
	public String findEmail(String userName,int userRegistration,UserVO user,Model model) {
		user.setUserName(userName);
		user.setUserRegistration(userRegistration);
		
		String userEmail = service.findEmail(user);
		
		model.addAttribute("userEmail",userEmail);
		String viewName ="findEmailResult";
		
		return viewName;
	}
	
}
