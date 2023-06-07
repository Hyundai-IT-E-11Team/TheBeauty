package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

@Mapper
public interface UserDAO {

	// 회원가입
	int insertUser(UserVO userVO);

	// 회원가입 시 이메일 중복 검사
	String selectOneUserMail(String userMail);
	
	// 로그인
	UserVO selectUserByDTO(UserDTO dto);
	
	// 아이디 찾기
	UserVO selectOne(UserDTO dto);

	//비밀번호 찾기
	UserVO selectPassword(UserVO user);

	//비밀번호 변경
	int updatePassword(UserVO user);
}
