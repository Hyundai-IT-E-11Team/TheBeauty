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
		System.out.println(dao.selectUserByDTO(dto));
		return null;
	}

	public String findEmail(UserVO user) {

		user = dao.selectOne(user);

		return user.getUserMail();
	}

	// 회원가입
	public boolean registerUser(UserVO userVO) {

		int cnt = dao.insertUser(userVO);
		
		if(cnt!=1) {
			//rollback
			return false;
		} else {
			return true;
		}
	}
	
	// 회원가입 시 이메일 중복 검사
	public String checkMail(String userMail) {
		
		String result = dao.selectOneUserMail(userMail);
		System.out.println(result);
		return result;
	}

	public UserVO findPassword(String userMail, String userRegistration) {

		return dao.selectPassword(userMail, userRegistration);
	}

}
