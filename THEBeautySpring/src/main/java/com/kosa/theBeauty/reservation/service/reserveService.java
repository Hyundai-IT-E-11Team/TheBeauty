package com.kosa.theBeauty.reservation.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.reservation.dao.reserveDAO;
import com.kosa.theBeauty.reservation.domain.BrandVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class reserveService {

	private final reserveDAO dao;
	
	public String getBrandInfo(BrandVO vo) {
		try {
			return  dao.selectBrandInfo(vo).getBrandImgurl();
		} catch (Exception e) {
			return null;
		}
	}

	public String getProductInfo(BrandVO vo) {
		try {
			return  dao.selectProductInfo(vo).getProductImgurl();
		} catch (Exception e) {
			return null;
		}
	}
	
}
