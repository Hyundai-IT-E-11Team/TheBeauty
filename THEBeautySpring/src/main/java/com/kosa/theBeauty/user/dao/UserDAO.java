package com.kosa.theBeauty.user.dao;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

public interface UserDAO {

	UserVO selectUserByUserDTO(UserDTO dto);
	UserVO selectUserIdByUserDTO(UserDTO dto);
	UserVO selectPasswordByUserVO(UserVO user);
	String selectUserMailByUserMail(String userMail);
	int insertUser(UserVO userVO);
	int updatePassword(UserVO user);
}
