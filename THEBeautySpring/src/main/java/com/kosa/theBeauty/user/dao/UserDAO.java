package com.kosa.theBeauty.user.dao;

import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

  UserVO selectOne(UserVO user);
	UserVO insertUser();
	UserVO selectPassword(String userMail, int userRegistration);
}
