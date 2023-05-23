package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

	String selectUserByDTO(UserDTO dto);

	UserVO selectOne(UserVO user);

	// 회원가입
	int insertUser(UserVO userVO);
	
	// 회원가입 시 이메일 중복 검사
	String selectOneUserMail(String userMail);
	
	UserVO selectPassword(String userMail, String userRegistration);

}
