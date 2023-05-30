package com.kosa.theBeauty.reservation.dao;

import com.kosa.theBeauty.reservation.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ProductVO;

public interface reserveDAO {
	
	BrandVO selectBrandInfo(BrandVO vo);
	ProductVO selectProductInfo(BrandVO vo);
}
