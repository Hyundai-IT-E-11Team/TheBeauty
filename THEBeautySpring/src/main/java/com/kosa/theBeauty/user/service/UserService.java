package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserDAO dao;

	public UserVO login(UserDTO dto) {
		System.out.println(dao.selectUserByDTO(dto));
		return null;
	}

	@DebugLog
	public String findEmail(UserDTO dto) {
		
		String userMail ;
		try {
			userMail = dao.selectOne(dto).getUserMail();
		} catch (Exception e) {
			userMail = "입력하신 정보의 아이디가 없습니다.";
		}
		return userMail;
	}

	public UserVO registerUser(UserVO userVO) {

		return dao.insertUser();
	}

	public UserVO findPassword(String userMail, int userRegistration) {

		return dao.selectPassword(userMail, userRegistration);
	}

}
