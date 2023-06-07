package com.kosa.theBeauty.main.dao;

import com.kosa.theBeauty.product.domain.BrandVO;

public interface MainDAO {

	BrandVO selectBrnadByRoleNum(int roleNum);
	BrandVO selectBrandByBrandName(String brandName);
}
