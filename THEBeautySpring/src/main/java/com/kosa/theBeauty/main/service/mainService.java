package com.kosa.theBeauty.main.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.main.dao.mainDAO;
import com.kosa.theBeauty.product.domain.BrandVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class mainService {

	 private final mainDAO dao;
	
	 public BrandVO getBrandInfo(int roleNum) {

	      return dao.selectBrnadByUser(roleNum);
	   }
}
