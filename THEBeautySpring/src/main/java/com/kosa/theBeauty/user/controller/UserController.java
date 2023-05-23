package com.kosa.theBeauty.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController {

	private final UserService service;

	@DebugLog
	@PostMapping("login")
	public String login(UserDTO dto) {
		service.login(dto);
		return null;
	}

	// 비밀번호 찾기 페이지로 이동
	@GetMapping("password")
	public String showFindPwPage() {

		return "user/FindPw";
	}

	// 비밀번호 찾기 실행
	@DebugLog
	@PostMapping("password")
	public String findPasswordService(@RequestParam String userMail, @RequestParam String userRegistration) {

		UserVO userVO = service.findPassword(userMail, userRegistration);
		if (userVO != null) {
			return userVO.getUserPw();
		}
		return "잘못된 요청입니다. 다시 입력 해주세요.";
	}

	// 회원가입 페이지로 이동
	@GetMapping("registerPage")
	public String registerPage() {
		return "user/register";
	}

	// 회원가입
	@DebugLog
	@PostMapping("register")
	public String register(UserVO userVO, Model model) {
		boolean result = service.registerUser(userVO);
		
		if(result) {
			model.addAttribute("user",userVO);
		} else {
			model.addAttribute("user","유저생성실패");
		}
		
		return "user/loginsample";
	}

	// 회원가입 시 이메일 중복 검사
	@PostMapping("checkMailDuplicate")
	public ResponseEntity<String> checkMailDuplicate(@RequestParam String userMail, Model model) {
		String mail = service.checkMail(userMail);
		
		if(mail!=null) {
			return new ResponseEntity<String>("사용 가능",HttpStatus.CONFLICT);
		} else { 
			return new ResponseEntity<String>("사용 불가능",HttpStatus.OK);

		}
	}
	
		
//	{
//		result: false
//	}

	// 회원가입 시 이메일 중복 확인
//	@PostMapping("checkMail.do")
//	@ResponseBody
//	public boolean checkMail(@RequestParam String userMail) {
//	    boolean isDuplicated = service.checkEmailDuplicate(userMail);
//	    if (isDuplicated) {
//	        return false;
//	    } else {
//	        return true;
//	    }
//	}


	@DebugLog
	@PostMapping(value = "findEmail")
	public String findEmail(String userName, String userRegistration, UserVO user, Model model) {
		user.setUserName(userName);
		user.setUserRegistration(userRegistration);

		String userEmail = service.findEmail(user);

		model.addAttribute("userEmail", userEmail);
		String viewName = "findEmailResult";

		return viewName;
	}
}
