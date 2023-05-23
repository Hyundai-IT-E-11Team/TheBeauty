package com.kosa.theBeauty.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "user/findPw";
	}
	
	// 비밀번호 변경 페이지로 이동
	@PostMapping("passwordChange")
	public String showChangePwPage(UserVO user, Model model) {
		//db 검색
		boolean ck = service.findPassword(user);
		
		if(ck) {
			 return "user/changePw";
		}else {
			 //model.addAttribute("message", "잘못된 요청입니다. 다시 입력해주세요.");
			 return "redirect:/user/password";
		}
	}
  
	// 비밀번호 변경 실행
	@PostMapping("updatePassword")
	public String updatePasswordService(String userMail, String newPassword, Model model) {

	    boolean isUpdated = service.updatePassword(userMail, newPassword);
	    if(isUpdated) {
	        return "user/loginSample"; // 비밀번호 업데이트 성공 시 보여줄 뷰 이름
	    } else {
	        //model.addAttribute("message", "비밀번호 업데이트에 실패했습니다.");
	        return "redirect:/user/changePw";
	    }
	}
	
  @DebugLog
	@PostMapping
	public String post(UserVO userVO) {
		
		service.registerUser(userVO);
		
		return "user/login";
  }
  
  @DebugLog
	@PostMapping(value="findEmail")
	public String findEmail(String userName, String userRegistration, UserVO user, Model model) {
		user.setUserName(userName);
		user.setUserRegistration(userRegistration);
		
		String userEmail = service.findEmail(user);
		
		model.addAttribute("userEmail",userEmail);
		String viewName ="findEmailResult";
		
		return viewName;
	}
}
