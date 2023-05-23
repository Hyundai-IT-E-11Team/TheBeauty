package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Mapper
public interface UserDAO {

	public UserVO selectOne(UserVO user);

}
