package com.kosa.theBeauty.user.dao;

import org.apache.ibatis.annotations.Mapper;
import com.kosa.theBeauty.user.domain.FindPwVO;

@Mapper
public interface FindPwDAO {
	
	FindPwVO selectPassword();
}
