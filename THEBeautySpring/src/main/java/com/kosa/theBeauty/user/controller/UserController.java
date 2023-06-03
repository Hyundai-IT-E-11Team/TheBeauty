package com.kosa.theBeauty.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("user")
@RequiredArgsConstructor
@SessionAttributes(value = { "currUser" })
public class UserController {

	private final UserService service;

	@DebugLog
	@GetMapping("login")
	public String login() {
		return "user/login";
	}

	// 로그인
	@DebugLog
	@PostMapping("login")
	public String login(UserDTO dto, Model model) {
		UserVO vo = service.login(dto);
		System.out.println(vo);
		if (vo == null) {
			return "redirect:/user/login";
		} else {
			model.addAttribute("currUser", vo);
			return "redirect:../main/mainPage";
		}
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
		return "redirect:login";
	}

	// 회원가입 시 이메일 중복 검사
	@PostMapping("checkMailDuplicate")
	public ResponseEntity<String> checkMailDuplicate(@RequestParam String userMail, Model model) {
		String mail = service.checkMail(userMail);

		if (mail != null) {
			return new ResponseEntity<String>("사용 가능", HttpStatus.CONFLICT);
		} else {
			return new ResponseEntity<String>("사용 불가능", HttpStatus.OK);

		}
	}

	// 아이디 찾기
	@DebugLog
	@GetMapping("findEmail")
	public String findEmail() {
		return "user/findEmail";
	}

	@DebugLog
	@PostMapping("findEmail")
	public String findEmail(UserDTO dto, Model model) {

		String userEmail = service.findEmail(dto);
		model.addAttribute("userEmail", userEmail);

		return "user/findEmailResult";
	}

	// 비밀번호 찾기 페이지로 이동
	@GetMapping("password")
	public String showFindPwPage() {
		return "user/findPw";
	}

	// 비밀번호 변경 페이지로 이동
	@PostMapping("changePassword")
	public String showChangePwPage(UserVO user, Model model) {
		// db 검색
		boolean ck = service.findPassword(user);

		if (ck) {
			return "user/changePw";
		} else {
			// model.addAttribute("message", "잘못된 요청입니다. 다시 입력해주세요.");
			return "redirect:/user/password";
		}
	}

	// 비밀번호 변경 실행
	@DebugLog
	@PostMapping("updatePassword")
	public String updatePasswordService(UserVO user) {

		boolean isUpdated = service.updatePassword(user);
		if (isUpdated) {
			return "redirect:login"; // 비밀번호 업데이트 성공 시 보여줄 뷰 이름
		} else {
			// model.addAttribute("message", "비밀번호 업데이트에 실패했습니다.");
			return "redirect:/user/changePw";
		}
	}

}
