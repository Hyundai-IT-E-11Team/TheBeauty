package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserDAO dao;

	public UserVO login(UserDTO dto) {
		return dao.selectUserByDTO(dto);
	}

	public String findEmail(UserVO user) {

		user = dao.selectOne(user);

		return user.getUserMail();
	}

	public UserVO registerUser(UserVO userVO) {

		return dao.insertUser();
	}

	public UserVO findPassword(String userMail, int userRegistration) {

		return dao.selectPassword(userMail, userRegistration);
	}

}
