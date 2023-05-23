package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

	String selectUserByDTO(UserDTO dto);
	UserVO selectOne(UserVO user);
	UserVO insertUser();
	UserVO selectPassword(UserVO user);
	int updatePassword(@Param("userMail") String userMail, @Param("newPassword") String newPassword);
}
