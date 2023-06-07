package com.kosa.theBeauty.main.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.main.dao.MainDAO;
import com.kosa.theBeauty.product.domain.BrandVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	
	 private final MainDAO mainDAO;
		
	 public BrandVO selectBrnadByRoleNum(int roleNum) {

	      return mainDAO.selectBrnadByRoleNum(roleNum);
	   }
	 
	 public BrandVO selectBrandByBrandName(String brandName) {
		 
		 return mainDAO.selectBrandByBrandName(brandName);
	 }
}
