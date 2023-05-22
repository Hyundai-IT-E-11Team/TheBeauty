package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.RegisterDAO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RegisterService {

	private final RegisterDAO dao;
	
	public UserVO registerUser(UserVO userVO) {
		return dao.insertUser();
	}
}
