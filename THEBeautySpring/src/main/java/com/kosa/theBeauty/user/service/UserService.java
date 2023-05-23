package com.kosa.theBeauty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	public UserVO login(UserDTO dto) {
		System.out.println(dao.selectUserByDTO(dto));
		return null;
	}
}
