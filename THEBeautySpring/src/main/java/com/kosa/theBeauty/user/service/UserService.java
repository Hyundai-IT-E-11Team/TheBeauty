package com.kosa.theBeauty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private UserDAO dao;
	
	public String findEmail(UserVO user) {

		user = dao.selectOne(user);
		
		return user.getUserEMail();
	}

}
