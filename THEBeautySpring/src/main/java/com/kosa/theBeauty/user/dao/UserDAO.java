package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

	UserVO selectUserByDTO(UserDTO dto);

	UserVO selectOne(UserDTO dto);
  
  // 회원가입
	int insertUser(UserVO userVO);
	
	// 회원가입 시 이메일 중복 검사
	String selectOneUserMail(String userMail);

	UserVO selectPassword(String userMail, int userRegistration);
}
