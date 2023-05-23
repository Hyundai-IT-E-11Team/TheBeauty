package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

	UserVO selectUserByDTO(UserDTO dto);

	UserVO selectOne(UserVO user);

	UserVO insertUser();

	UserVO selectPassword(String userMail, int userRegistration);
}