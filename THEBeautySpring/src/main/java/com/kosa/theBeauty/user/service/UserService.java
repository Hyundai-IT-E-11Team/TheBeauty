package com.kosa.theBeauty.user.service;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

public interface UserService {
	
	UserVO login(UserDTO dto);
	String findEmail(UserDTO dto);
	String checkMail(String userMail);
	boolean registerUser(UserVO userVO);
	boolean findPassword(UserVO user);
	boolean updatePassword(UserVO vo);
}
