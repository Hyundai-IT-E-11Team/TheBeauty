package com.kosa.theBeauty.test.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.test.dao.TestDAO;
import com.kosa.theBeauty.test.domain.TestVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TestService {
	
	private final TestDAO dao;
	
	public TestVO testService() {
		return dao.selectTest();
	}
}
