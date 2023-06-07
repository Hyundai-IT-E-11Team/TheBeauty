package com.kosa.theBeauty.main.dao;

import com.kosa.theBeauty.product.domain.BrandVO;

public interface mainDAO {

	BrandVO selectBrnadByUser(int roleNum);

	BrandVO selectBrandByName(String brandName);

}
