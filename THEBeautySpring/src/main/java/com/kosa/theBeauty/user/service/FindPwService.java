package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.user.dao.FindPwDAO;
import com.kosa.theBeauty.user.domain.FindPwVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FindPwService {
	
	private final FindPwDAO dao;
	
	private FindPwVO findPwService(FindPwVO vo) {
		
		return dao.selectPassword();

	}
}
