package com.kosa.theBeauty.user.dao;

import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

public interface UserDAO {

	String selectUserByDTO(UserDTO dto);
}
