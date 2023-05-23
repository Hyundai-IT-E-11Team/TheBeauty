package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserDAO dao;

	public UserVO registerUser(UserVO userVO) {
    
		return dao.insertUser();
	}
  
  public UserVO findPassword(String userMail, int userRegistration) {
    
    return dao.selectPassword(userMail, userRegistration);
  }
  
}
