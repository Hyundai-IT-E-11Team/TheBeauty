package com.kosa.theBeauty.main.service;

import com.kosa.theBeauty.product.domain.BrandVO;

public interface MainService {
	
	BrandVO selectBrnadByRoleNum(int roleNum);
	BrandVO selectBrandByBrandName(String brandName);
}
