package com.kosa.theBeauty.test.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.test.domain.TestVO;

@Mapper
public interface TestDAO {

	TestVO selectTest();
}
